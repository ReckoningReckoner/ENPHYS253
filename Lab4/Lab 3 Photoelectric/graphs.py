import matplotlib.pyplot as plt


def linear_plot(**kwargs):
    plt.figure(figsize=(10,8))
    plt.errorbar(kwargs["xdata"],
                 kwargs["ydata"], 
                 yerr=kwargs["yerr"], 
                 xerr=kwargs["xerr"],
                 fmt='.', 
                 capsize=3, 
                 label=kwargs["data"])
    
    if "lin_label" not in kwargs:
        kwargs["lin_label"] = "Weighted Linear Regression"
        
    plt.plot(kwargs["xdata"], kwargs["slope"] * kwargs["xdata"] + kwargs["intercept"], 
             label=kwargs["lin_label"])
    plt.legend()
    plt.ylim(ymin=0)
    plt.xlim(xmin=0)
    plt.title(kwargs["title"])
    plt.ylabel(kwargs["ylabel"])
    plt.xlabel(kwargs["xlabel"])
    
    if "annotate" in kwargs:
        plt.annotate(kwargs["annotate"], 
                     xy=kwargs["xy"])
    plt.show()
