import matplotlib.pyplot as plt
import qexpy as q


def linear_plot(**kwargs):
    plt.figure(figsize=(10, 8))
    if "xerr" not in kwargs:
        kwargs["xerr"] = 0
    if "yerr" not in kwargs:
        kwargs["xerr"] = 0

    # Plot points
    plt.errorbar(kwargs["xdata"],
                 kwargs["ydata"],
                 yerr=kwargs["yerr"],
                 xerr=kwargs["xerr"],
                 fmt='.',
                 capsize=3,
                 label=kwargs["data_name"])

    if "lin_label" not in kwargs:
        kwargs["lin_label"] = "Weighted Linear Regression"

    # Generate Line
    if "slope" not in kwargs or "intercecpt" not in kwargs:
        dataset = q.XYDataSet(xdata=kwargs["xdata"],
                              ydata=kwargs["ydata"],
                              yerr=kwargs["yerr"],
                              xerr=kwargs["xerr"])
        intercept, slope = dataset.fit("linear")
        print("Regression: {:6e} +/- x {:3e} + {:6e} +/- {:3e}".
              format(slope.mean, slope.std, intercept.mean, intercept.std))
        kwargs["slope"] = slope
        kwargs["intercept"] = intercept

    # Plot line
    plt.plot(kwargs["xdata"], kwargs["slope"].mean * kwargs["xdata"] +
             kwargs["intercept"].mean,
             label=kwargs["lin_label"])
    plt.legend()
    plt.title(kwargs["title"])
    plt.ylabel(kwargs["yname"] + " " + kwargs["yunits"])
    plt.xlabel(kwargs["xname"] + " " + kwargs["xunits"])

    # Annotate Line
    if "auto_annotate" in kwargs and kwargs["auto_annotate"]:
        plt.annotate("{:.2e} * {} + {:.2e} = {}".format(
            kwargs["slope"].mean,
            kwargs["xname"],
            kwargs["intercept"].mean,
            kwargs["yname"]),
            xy=(kwargs["xdata"][len(kwargs["xdata"])//2],
                kwargs["ydata"][len(kwargs["ydata"])//2]))
    elif "annotate" in kwargs:
        plt.annotate(kwargs["annotate"],
                     xy=kwargs["xy"])

    # Save figgure
    if "path" in kwargs:
        plt.savefig(kwargs["path"])
    plt.show()

    return kwargs["slope"], kwargs["intercept"]
