---
title: Pure CSS design system in tailwind VS web components, angular, react, vue, svelte 
description: I was wondering the best way to make a reusable design system. Choosing a frontend framework is hard since everyone has its favorite. so I'm developing a pure scss + tailwind design system 
layout: layouts/post 
image: /assets/img/why-a-pure-css-tailwind-design-system.jpg 
imageAlt: the butopen design system 
permalink: /blog/why-a-pure-css-tailwind-design-system/
tags: ['design system', 'tailwind', 'developer experience', 'DX', 'software design', 'butopen']
---

I was wondering the best way to make a reusable design system.

Choosing a frontend framework is hard since **everyone has its own favorite web framework**.

So I'm developing a pure CSS design system that is growing well, written in modern CSS: 
**[scss](https://sass-lang.com/)+ [tailwind](https://tailwindcss.com/) + [CSS3 vars](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)**.

It's open source and you can find it at
[https://github.com/butopen/butopen-design-system](https://github.com/butopen/butopen-design-system)

But in this post, I will try to explain the reasons why a pure CSS-based design system is the winning choice over web
components or a specific framework.

## What technology to choose when building a design system
![Web frameworks](/assets/img/web-frameworks.jpg)


When developing a design system that you want to reuse in many projects, the possibilities are different:

1) **go popular**:  create a design system in the most popular framework (React)
2) **love everyone**: create a design system with a technology that allows you to export the code for each framework, such as StencilJS
3) **go with standards**: develop the design system using web components, so that (in theory) it can be integrated into any framework (using
   pure web components or lit-element)
4) **go with the alternative**: don't use any framework at all

You already know the choice I made: no framework. But why?

## Why choosing a specific framework is a bad idea

If you look at the frontend development market today, you will find that developers use one of the few frameworks
available: **[react](https://it.reactjs.org/)**, **[angular](https://angular.io/)**, **[vue](https://vuejs.org/)**, and most recently **[svelte](https://svelte.dev/)**.

Developing a design system for each of these frameworks is very expensive and as usual, **_if you love them all you end
up not pleasing anyone_**.

## Why choosing a _jolly framework_ is a bad idea

An alternative could be to use a technology like StencilJS, which allows you to export the native code for each of the
above frameworks.

But unless we stop at simple buttons or links, the problem is always the same:
although Stencil is a good framework, **a component written by a dev has a usability degree that is ten times higher than
the code generated** by Stencil.

## What about web components?

So why not use web components?

While it is true that you can integrate a web component into any of these frameworks, the reality is that if you need a
button, you prefer to use a native one and NOT some `<bo-button> ... </bo-button>`
after having embedded external lib.

It is difficult to convince a frontend developer to use a pure web component in another framework: **Confidence**? 
**bundle size**? **safety**?

Yes, but there are other reasons IMHO:

- the frontend developer wants to **keep control** over any component (especially the atomic components)

- having a < bo-button > without any logic, with a template consisting of just
  `<button class = '...'> {{buttonLabel}} </button>` is an **anti-pattern**
  (you could get the same effect with only a CSS class)

- web components have this wonderful **shadow dom** concept ... which is not safe at all and a nightmare to use in
  practice in an extended project

- if you have been working with angular material, using a `<mat-button>` might look good at first, but when you have a
  more complicated scenario customizing / configuring is very very very difficult. This would be true for black box web components too

## Should you reinvent the wheel each time?

In my company, for an Angular project, we created our own custom angular design system and used it in several projects.
In another project written in svelte, a custom svelte design system.

Could we have **reused the CSS part only in both of the above design systems**? I think so and this is the reason for
[the ButOpen design system](https://github.com/butopen/butopen-design-system).

I believe that a design system conceived in this way can be successful if one condition is true:
**integrating it into your framework is a matter of minutes**. And this is the intended goal of ButOpen.

These are the main reasons why I decided to develop a design system in pure CSS. Written using modern CSS techniques
like Sass (scss), tailwind, and CSS3 variables.

That said, **are web components bad?** 

I don't think so: I've seen that the main use case of web components to date is for
websites / apps that need to integrate spot components that would be really complicated to implement again, like a
YouTube viewer or pdf viewer. For simple buttons, the developer still prefers to be native.

Note:

This post was written after a friend of mine (Francesco Benedetto) asked me
"why not using web components?". I was replying to his linkedin comment, but linkedin allows at most 100 words and I
have no time to write everything above again, but in 100 words :-)
If you want to comment, this is the linkedin post: [https://bit.ly/3Lwk3C8](https://bit.ly/3Lwk3C8)
