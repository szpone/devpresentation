<link rel="stylesheet" type="text/css" href="assets/styles.css">

# Stare, nowe i najnowsze - jak podążać za zmianami trendów  {.title .main data-background-image="./assets/background.jpg"}

<p class="paragraph">Piotr Rygielski & Nikola Adamus</p>

# Kilka słów o nas... {.title .main data-background-image="./assets/background.jpg"}

![](assets/signet-logo.png)

<p class="paragraph"> Chcecie się dowiedzieć więcej? https://tellyo.com!

## {data-background-image="./assets/rugby.png"}

# CZĘŚĆ I - Anuglarj.js {.title data-background-image="./assets/background.jpg"}

![](assets/meme.jpg)

## 3 kluczowe sprawy {.title .main data-background-image="./assets/background.jpg"}

<ul class="paragraph">
    <li> Data-binding </li>
    <li> Lepsza testowalność </li>
    <li> Wsparcie Google (a więc i aktywne community) </li>
</ul>

## Dużo tego się zrobiło...

<p> slajd </p>

# CZĘŚĆ II - Czas coś zmienić {.title data-background-image="./assets/background.jpg"}

## PRZEPISUJEMY! Ale małymi kroczkami... {.title .main data-background-image="./assets/background.jpg"}

![](assets/refactoring.gif)

## Nadchodzi nowe... {.title .main data-background-image="./assets/background.jpg"}

## Powody biznesowe {.title .main data-background-image="./assets/background.jpg"}

<ul class="paragraph">
    <li> Konieczność znalezienia nowych członków zespołu </li>
    <li> Opłacalność utrzymania </li>
</ul>


## Powody techniczne {.title .main data-background-image="./assets/background.jpg"}

<ul class="paragraph">
    <li> Łatwiej napisać to od nowa </li>
    <li> Lepsza elastyczność kodu </li>
</ul>

## Stack technologiczny {.title .main data-background-image="./assets/background.jpg"}

<ul class="paragraph">
    <li> Typescript </li>
    <li> ES6 </li>
    <li> Saga + Redux </li>
    <li> Storybook </li>
</ul>

## A tu stack Angularowy... {.title .main data-background-image="./assets/background.jpg"}

<ul class="paragraph">
    <li> ES5 </li>
    <li> Angular.js 1.2 </li>
    <li> Grunt </li>
</ul>

## {.title .main data-background-image="./assets/background.jpg"}

<p class="paragraph"> Reacta kocha 71.47% devów (a przerażający jest dla 28.53%) </p>

## {.title .main data-background-image="./assets/background.jpg"}

<p class="paragraph"> Z kolei Angulara... 55.82% (a przerażający jest dla 44.18%) </p>

## A gdyby tak spojrzeć na popularność? {.title .main data-background-image="./assets/background.jpg"}

<p class="paragraph"> 41.4% praktykujących devów używa Reacta w porównaniu do 26.23% korzystających z Angulara </p>

# CZĘŚĆ III - Integracja {.title .main data-background-image="./assets/background.jpg"}

## Dlaczego nie Micro Frontends? {.title .main data-background-image="./assets/background.jpg"}

![](assets/microf.png)

## Osadzanie Reacta w Angularze {.title .main data-background-image="./assets/background.jpg"}

## Niby proste... {.title .main data-background-image="./assets/background.jpg"}


```
ReactDOM.render(<h1>Tellyo world! </h1>,  document.getElementById('root'));
```

## A jednak nie do końca {.title .main data-background-image="./assets/background.jpg"}

<pre><code class="hljs">
var React = window.React;
  var h = React.createElement;
  var ReactDOM = window.ReactDOM;

  function render(ReactComponent, props, store, wrapper) {
    return h(wrapper, { store: store }, h(ReactComponent, props));
  }


window.directify = function directify(ReactComponent, wrapper) {
    return [
      "rReduxStore",
      function (rReduxStore) {
        return {
          restrict: "E",
          link: function (scope, element, attrs) {
            ReactDOM.render(
              render(ReactComponent, attrs, rReduxStore, wrapper),
              element[0]
            );

            scope.$on("$destroy", function () {
              console.warn("ReactDOM.unmountComponentAtNode ", element[0]); // to można skasować ;-)
              ReactDOM.unmountComponentAtNode(element[0]);
            });

            Object.keys(attrs.$attr).forEach(function (attrKey) {
              attrs.$observe(attrKey, function () {
                ReactDOM.render(
                  render(ReactComponent, attrs, rReduxStore, wrapper),
                  element[0]
                );
              });
            });
            
          },
        };
      },
    ];
  };

  </code></pre>

## {.title .main data-background-image="./assets/background.jpg"}


<pre><code class="hljs">
/* eslint-disable no-trailing-spaces */
(function (angular) {
    "use strict";
  
    angular.module("tellyo.r-pro")
      .run(["$rootScope", "rReduxStore", "$timeout", subscribe]);

    function subscribe($rootScope, rReduxStore, $timeout){
       $rootScope.$on("EXTERNAL_CHANGE_ORGANIZATION", function(){
        $timeout(function(){
            changeOrganization($rootScope, rReduxStore)
        })
       });
    }
  
    function changeOrganization($rootScope, rReduxStore) {
        rReduxStore.dispatch({
            type: "EXTERNAL_CHANGE_ORGANIZATION",
            external: true,
            payload: {
              condition: false
            }
          });
    }
  }(
    // eslint-disable-next-line no-undef
    angular
  ));
  
</code> </pre>

## {.title .main data-background-image="./assets/background.jpg"}


<pre><code class="hljs">
.directive(
      "rProfileSettings",
      directify(TellyoPro.ProfileSettings, TellyoPro.AngularWrapper)
    )

    </code></pre>

## {.title .main data-background-image="./assets/background.jpg"}


<pre><code class="hljs">
 input[type="text"]:not([data-r-pro]) {
        width: 134px;
        height: 48px;
        margin: 6px 0;
        margin-left: 24px;
        border: 0;
        background-color: transparent;
        color: #fff;
      }
      </code></pre>




# Wielkie dzięki! {.title .main data-background-image="./assets/background.jpg"}

![](assets/thatsall.png){.image}

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/styles/base16/zenburn.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/highlight.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/languages/javascript.min.js"></script>
