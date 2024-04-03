import { totalStars } from "utils";

export function createStars() {
  const body = document.querySelector("body")!;
  for (let i = 0; i < totalStars; i++) {
    const star = document.createElement("div");
    star.classList.add("star");
    star.style.top = `${Math.random() * 100}%`;
    star.style.left = `${Math.random() * 100}%`;
    star.style.animationDuration = `${Math.random() * 10 + 5}s`;
    body.appendChild(star);
  }
}
