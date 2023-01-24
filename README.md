# r6-and-shiny

This repo demonstrates an approach to use R6Class shiny modules without sharing state.

## Example 1 - No shared state (the desired outcome)

The key to not share any state is to instantiate the module inside of the server function. See [app-no-shared-state.R](./app-no-shared-state.R). The downside of this approach is that you instantiate the object twice. This could slow down the performance of the app.

```r
shiny::runApp('app-no-shared-state.R')
```

In the gif below two different sessions are running. Notice that the changes to the input box in one session have no effect on the other session.

![Gif of not shared state.](./imgs/no-shared-state.gif)

## Example 2 - Shared state (the bad outcome)

In this example, the class is instantiated outside of the server function. See [app-shared-state.R](./app-shared-state.R).

```r
shiny::runApp('app-shared-state.R')
```

In the gif below two different sessions are running. Notice that when changes are made to the session on the right hand side the value also changes on the left hand side.

![Gif of shared state.](./imgs/shared-state.gif)

## Example 3 - Do not use R6

In this example, we do not use R6 at all. Both the UI and the server as defined only as functions. See [app-no-r6.R](./app-no-r6.R).

```r
shiny::runApp('app-no-r6.R')
```
