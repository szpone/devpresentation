---
parallaxBackgroundImage: "./assets/background.jpg"
parallaxBackgroundSize: "100vw 100vh"
parallaxBackgroundHorizontal: 0
parallaxBackgroundVertical: 0
---

# Stare, nowe i najnowsze - jak podążać za zmianami trendów

Piotr Rygielski & Nikola Adamus

# Kilka słów o nas...

![](assets/signet-logo.png)

Chcecie się dowiedzieć więcej? https://tellyo.com!

## {data-background-image="./assets/rugby.png"}

# CZĘŚĆ I - Anuglarj.js

![](assets/meme.jpg)

## 3 kluczowe sprawy

* *Data-binding
* *Lepsza testowalność
* *Wsparcie Google (a więc i aktywne community)

## Dużo tego się zrobiło...

slajd

# CZĘŚĆ II - Czas coś zmienić

## PRZEPISUJEMY! Ale małymi kroczkami...

![](assets/refactoring.gif)

## Nadchodzi nowe...

## Powody biznesowe

* Konieczność znalezienia nowych członków zespołu
* Opłacalność utrzymania


## Powody techniczne

* Łatwiej napisać to od nowa
* Lepsza elastyczność kodu

## Stack technologiczny

* Typescript
* ES6
* Saga + Redux
* Storybook

## A tu stack Angularowy...

* ES5
* Angular.js 1.2
* Grunt

##

Reacta kocha 71.47% devów (a przerażający jest dla 28.53%)

##

Z kolei Angulara... 55.82% (a przerażający jest dla 44.18%)

## A gdyby tak spojrzeć na popularność?

41.4% praktykujących devów używa Reacta w porównaniu do 26.23% korzystających z Angulara

# CZĘŚĆ III - Integracja

## Dlaczego nie Micro Frontends?

![](assets/microf.png)

## Osadzanie Reacta w Angularze

## Niby proste...

```jsx
ReactDOM.render(<h1>Tellyo world! </h1>, document.getElementById('root'));
```

##

```jsx
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
```

##

```js
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
```

##

```js
.directive(
  "rProfileSettings",
  directify(TellyoPro.ProfileSettings, TellyoPro.AngularWrapper)
)
```

##


```css
input[type="text"]:not([data-r-pro]) {
  width: 134px;
  height: 48px;
  margin: 6px 0;
  margin-left: 24px;
  border: 0;
  background-color: transparent;
  color: #fff;
}
```

# Wielkie dzięki!

![](assets/thatsall.png){.image}
