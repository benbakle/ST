var colorShader = function () {
    var $colorShade = $(".color-shade");
    var getRGB = function (rgb, color) {
        var rgbPos = { red: 0, green: 1, blue: 2 };
        var colors = rgb.slice(4, (rgb.length - 1));
        var colorArray = colors.split(",");
        return colorArray[rgbPos[color]];
    }
    var shadeColor = function (color, shade, brightness) {
        var adj = {
            darken: {
                range: 0,
                incr: Math.round(color * shade) * -1
            },
            lighten: {
                range: 255,
                incr: Math.round((255 - color) * shade)
            }
        }

        var range = adj[brightness]["range"];
        if (color != range) {
            range = parseInt(color) + parseInt(adj[brightness]["incr"]);
        }
        return range;
    }

    var setShade = function ($target, property, dataAttr) {
        var color = $target.css(property);
        var red = getRGB(color, "red");
        var green = getRGB(color, "green");
        var blue = getRGB(color, "blue");
        var dataShade = $target.attr(dataAttr);

        if (dataShade != undefined) {
            var shade = dataShade.substr(dataShade.length - 1);
            var brightness = dataShade.split("-")[0];
            shade = parseInt(shade) / 10;

            var adjColor = {
                red: shadeColor(red, shade, brightness),
                green: shadeColor(green, shade, brightness),
                blue: shadeColor(blue, shade, brightness)
            }
            $target.css(property, "rgb(" + adjColor["red"] + "," + adjColor["green"] + "," + adjColor["blue"])
        }
    }

    $.each($colorShade, function () {
        setShade($(this), "background-color", "data-shade")
        setShade($(this), "color", "data-text-shade");
    });
}