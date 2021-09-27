# Stare, nowe i najnowsze - jak podążać za zmianami trendów  {.title .main data-background-image="./assets/background.jpg"}

<p class="paragraph">Piotr Rygielski & Nikola Adamus</p>

# Kilka słów o nas... {.title .main data-background-image="./assets/background.jpg"}

![](assets/signet-logo.png)

## {data-background-image="./assets/rugby.png"}

# CZĘŚĆ I - Anuglarj.js {.title data-background-image="./assets/background.jpg"}

![](assets/meme.jpg)


## 3 kluczowe sprawy {.title .main data-background-image="./assets/background.jpg"}

<ul class="paragraph">
    <li> Modularność </li>
    <li> Szybszy development </li>
    <li> Deklaratywny UI oraz wsparcie Google </li>
</ul>

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
    <li> Saga + Redux </li>
    <li> Storybook </li>
</ul>


# CZĘŚĆ III - Integracja {.title .main data-background-image="./assets/background.jpg"}

## Dlaczego nie Micro Frontends? {.title .main data-background-image="./assets/background.jpg"}

![](assets/microf.png)

## Osadzanie Reacta w Angularze {.title .main data-background-image="./assets/background.jpg"}

## {.title .main data-background-image="./assets/background.jpg"}

<pre><code>
(function (angular, TellyoPro) {
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
              console.warn("ReactDOM.unmountComponentAtNode ", element[0]);
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

</code> </pre>

# Wielkie dzięki! {.title .main data-background-image="./assets/background.jpg"}

![](assets/thatsall.png){.image}



<link rel="stylesheet" type="text/css" href="assets/styles.css">
