import React, { useEffect } from "react";
import gsap from "gsap";
import "./enter.css";
import Button from "../../../button";

export default function Enter({ children }) {
  {
    /* Animations:

      Animations occur on load of the Enter() component. This is to ensure that
      they only occur once upon a user starting an unauthenticated session.
      Animations do NOT repeat upon login/register view updates for this reason.

  */
  }

  useEffect(() => {
    const fetchImages = async () => {
      const urls = await getDownloadURLsFromFolder("itemcards/");
      urls.map((url, index) => console.log(index + ": " + url));
    };

    {
      /* Master Group Animation */
    }
    const tlFSports = gsap.timeline({
      defaults: {
        duration: 0.2,
        x: 0,
        y: 0,
        ease: gsap.parseEase("Back.easeOut.config(2)"),
        opacity: 1,
      },
    });
    const tlLoginNav = gsap.timeline({
      defaults: {
        duration: 1,
        ease: gsap.parseEase("Back.easeOut.config(2)"),
        opacity: 0,
      },
    });
    const tlLoginButton = gsap.timeline({
      defaults: {
        duration: 1,
        ease: gsap.parseEase("Back.easeOut.config(2)"),
        opacity: 0,
      },
    });

    {
      /* F Sports Spoof Logo Animation */
    }

    tlFSports
      .fromTo(
        "#cf42-f-letter-bottom",
        { delay: 0.4, scale: 5, transformOrigin: "center", y: 0, opacity: 0 },
        { delay: 0.4, scale: 1, opacity: 1, y: 0 },
      )
      .fromTo(
        "#cf42-f-letter-top",
        { delay: 0.4, scale: 5, transformOrigin: "center", x: 0, opacity: 0 },
        { delay: 0.4, scale: 1, opacity: 1, x: 0 },
      )
      .fromTo(
        "#cf42-f-ring",
        { delay: 0.4, scale: 5, transformOrigin: "center", y: 0, opacity: 0 },
        { delay: 0.4, scale: 1, opacity: 1, y: 0 },
      )
      .fromTo(
        "#cf42-right",
        {
          delay: 0.5,
          duration: 0.2,
          scale: 1,
          transformOrigin: "center",
          x: 200,
          opacity: 0,
        },
        { delay: 0.5, duration: 0.2, scale: 1, opacity: 1, x: 0 },
      );

    {
      /* Login Nav Animation */
    }
    tlLoginNav.fromTo(
      "#login-nav",
      { delay: 3.2, scale: 1, transformOrigin: "center", y: 30, opacity: 0 },
      { delay: 3.2, scale: 1, opacity: 1, y: 0 },
    );

    {
      /* Login Button Animation  */
    }
    tlLoginButton.fromTo(
      "#login-button",
      { delay: 3, scale: 1, transformOrigin: "center", y: 30, opacity: 0 },
      { delay: 3, scale: 1, opacity: 1, y: 0 },
    );

    fetchImages();
  }, []);

  return (
    <div id="enter-container">
      <div className="enter-column">
        <div id="enter-logo-container">
          <svg
            className="hero"
            id="enter-logo"
            data-name="master-group"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 273.94 91.9"
          >
            <g id="cf42-master-group" data-name="right">
              <g id="cf42" data-name="f-logo">
                <g id="cf42-f-letter" data-name="f-letter">
                  <g>
                    <path
                      id="cf42-f-letter-bottom"
                      d="M26.48,42.33c-1.54,2.32-3.08,4.64-4.62,6.96l.26.43h8.66l-9.83,15.4h9.83l9.29-15.43h8.1c1.65-2.48,3.22-4.84,4.89-7.36h-26.58Z"
                      fill="#fff"
                      stroke-width="0"
                    />
                    <path
                      id="cf42-f-letter-top"
                      d="M36.57,26.78h34.38c-1.63,2.55-3.13,4.92-4.66,7.31H31.88c1.61-2.51,3.1-4.84,4.69-7.31Z"
                      fill="#fff"
                      stroke-width="0"
                    />
                  </g>
                </g>
                <path
                  id="cf42-f-ring"
                  data-name="f-ring"
                  d="M45.95,91.9C20.61,91.9,0,71.29,0,45.95S20.61,0,45.95,0s45.95,20.61,45.95,45.95-20.61,45.95-45.95,45.95ZM45.95,3.85C22.74,3.85,3.85,22.74,3.85,45.95s18.89,42.1,42.1,42.1,42.1-18.89,42.1-42.1S69.16,3.85,45.95,3.85Z"
                  fill="#fff"
                  stroke-width="0"
                />
              </g>
              <g id="cf42-right">
                <g id="cf42-logo" data-name="cf42-logo">
                  <g
                    id="uuid-10279280-cc32-4ede-87ab-89f76064b43c"
                    data-name="cf-letters"
                  >
                    <path
                      d="M157.55,42.89h-13.92l-.49,1.02c-1.13,2.34-2.29,4.09-3.45,5.22-2.08,2.04-4.62,3.03-7.77,3.03-2.88,0-4.94-1.07-6.3-3.28-1.44-2.33-1.62-6.07-.54-11.11,1.09-5.18,2.94-9.2,5.51-11.97,2.48-2.66,5.26-3.96,8.52-3.96,3.06,0,5.06.78,6.13,2.41.61.92,1.01,2.47,1.14,4.47l.11,1.68h13.5l.25-1.5c.57-3.44.04-6.89-1.59-10.27h0c-2.99-6.09-9.07-9.17-18.06-9.17-6.6,0-12.58,2.19-17.77,6.5-5.89,4.9-9.84,11.93-11.74,20.9-1.79,8.41-1,15.2,2.35,20.18,3.44,5.05,9.08,7.61,16.76,7.61,6.11,0,11.58-1.82,16.26-5.42,4.63-3.56,8.06-8.23,10.2-13.9l.92-2.43Z"
                      fill="#fff"
                      stroke-width="0"
                    />
                    <polygon
                      points="198.02 30.45 176.39 30.45 178.03 22.71 202.75 22.71 205.35 10.46 166.73 10.46 155.54 63.27 169.44 63.27 173.82 42.6 195.46 42.6 198.02 30.45"
                      fill="#fff"
                      stroke-width="0"
                    />
                  </g>
                  <g id="cf42-42" data-name="42-numbers">
                    <path
                      d="M234.67,41.79h-5.48l6.45-30.29h-13.77l-24.89,30.42-2.32,10.92h19.2l-2.21,10.43h13l2.21-10.43h5.48l2.33-11.05ZM209.22,41.79l9.52-12.02-2.55,12.02h-6.97Z"
                      fill="#fbb040"
                      stroke-width="0"
                    />
                    <path
                      d="M259.17,45.58c3.86-2.38,6.68-4.49,8.6-6.46,2.95-3.02,4.86-6.54,5.69-10.44,1.12-5.24.27-9.55-2.53-12.83-2.78-3.25-7.05-4.89-12.7-4.89-7.06,0-12.62,2.69-16.53,7.99-2,2.72-3.57,6.3-4.64,10.63l-.55,2.23h12.97l.34-1.37c.61-2.49,1.3-4.29,2.04-5.35,1.19-1.69,2.82-2.48,5.15-2.48,1.95,0,2.6.68,2.92,1.19.6.96.72,2.19.37,3.79-.45,2.12-1.75,4.13-3.86,5.97-1.51,1.29-4.78,3.51-9.74,6.59-6.09,3.78-10.13,7.31-12.35,10.8-2.12,3.04-3.63,6.44-4.5,10.11l-.52,2.21h36.93l2.53-11.98h-18.68c1.08-.73,2.65-1.73,4.7-3l4.38-2.71Z"
                      fill="#fbb040"
                      stroke-width="0"
                    />
                  </g>
                </g>
                <g id="subtitle" data-name="subtitle">
                  <path
                    d="M112.33,75.05h.92l2.04,5.64h-.75l-.56-1.61h-2.37l-.56,1.61h-.75l2.04-5.64ZM113.74,78.42l-.95-2.77-.95,2.77h1.91Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M121.72,75.05v.67h-2.86v1.89h2.72v.65h-2.72v2.43h-.68v-5.64h3.55Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M122.53,77.88c0-1.84.97-2.96,2.58-2.96s2.58,1.12,2.58,2.96-.97,2.94-2.58,2.94-2.58-1.12-2.58-2.94ZM125.1,80.15c1.17,0,1.87-.87,1.87-2.27s-.7-2.29-1.87-2.29-1.86.87-1.86,2.29.7,2.27,1.86,2.27Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M132.8,76.76c0,.66-.45,1.16-.95,1.3.55.09.79.37.85.97l.16,1.66h-.69l-.14-1.59c-.05-.52-.39-.68-1.22-.68h-1.38v2.27h-.68v-5.64h2.14c1.18,0,1.92.66,1.92,1.71ZM130.87,77.75c.77,0,1.21-.36,1.21-1.01s-.43-1.03-1.21-1.03h-1.46v2.04h1.46Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M137.66,75.72h-1.76v4.98h-.68v-4.98h-1.76v-.67h4.2v.67Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M139.03,75.05l1.53,2.62,1.53-2.62h.81l-2,3.34v2.31h-.68v-2.31l-2-3.34h.81Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M147.46,75.72h-1.76v4.98h-.68v-4.98h-1.76v-.67h4.2v.67Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M148.77,75.05l1.16,4.71,1.15-4.71h.78l1.16,4.71,1.15-4.71h.75l-1.49,5.64h-.86l-1.11-4.26-1.11,4.26h-.85l-1.49-5.64h.75Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M155.25,77.88c0-1.84.97-2.96,2.58-2.96s2.58,1.12,2.58,2.96-.97,2.94-2.58,2.94-2.58-1.12-2.58-2.94ZM157.83,80.15c1.17,0,1.87-.87,1.87-2.27s-.7-2.29-1.87-2.29-1.86.87-1.86,2.29.7,2.27,1.86,2.27Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M167.07,75.05v.67h-2.86v1.82h2.77v.65h-2.77v1.84h2.93v.67h-3.61v-5.64h3.55Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M172.35,75.05l-1.84,2.81,1.86,2.83h-.79l-1.49-2.29-1.5,2.29h-.78l1.86-2.84-1.84-2.81h.79l1.49,2.26,1.47-2.26h.78Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M177.19,76.76c0,1.09-.74,1.74-2,1.74h-1.34v2.19h-.68v-5.64h2.03c1.26,0,2,.64,2,1.71ZM175.19,77.83c.85,0,1.28-.37,1.28-1.07s-.43-1.04-1.28-1.04h-1.34v2.11h1.34Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M181.88,75.05v.67h-2.86v1.82h2.77v.65h-2.77v1.84h2.93v.67h-3.61v-5.64h3.55Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M187.2,76.76c0,.66-.45,1.16-.95,1.3.55.09.79.37.85.97l.16,1.66h-.69l-.14-1.59c-.05-.52-.39-.68-1.22-.68h-1.38v2.27h-.68v-5.64h2.14c1.18,0,1.92.66,1.92,1.71ZM185.27,77.75c.77,0,1.21-.36,1.21-1.01s-.43-1.03-1.21-1.03h-1.46v2.04h1.46Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M189.16,75.05v5.64h-.68v-5.64h.68Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M194.17,75.05v.67h-2.86v1.82h2.77v.65h-2.77v1.84h2.93v.67h-3.61v-5.64h3.55Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M196.3,75.05l2.77,4.83v-4.83h.68v5.64h-.99l-2.73-4.75v4.75h-.68v-5.64h.95Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M203.43,80.82c-1.62,0-2.55-1.3-2.55-2.94s.92-2.96,2.55-2.96c1.2,0,1.99.75,2.23,1.86l-.72.05c-.18-.79-.73-1.24-1.51-1.24-1.29,0-1.84,1.07-1.84,2.29s.56,2.27,1.84,2.27c.83,0,1.38-.49,1.55-1.37l.73.05c-.21,1.18-.98,1.99-2.28,1.99Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                  <path
                    d="M210.26,75.05v.67h-2.86v1.82h2.77v.65h-2.77v1.84h2.93v.67h-3.61v-5.64h3.55Z"
                    fill="#fff"
                    stroke-width="0"
                  />
                </g>
              </g>
            </g>
          </svg>
        </div>
      </div>
      {children}
    </div>
  );
}
