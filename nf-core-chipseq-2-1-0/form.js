document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "TOWER_ACCESS_TOKEN (Optional)") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });
});
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "Resume") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });
});

document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "Input/output options") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });

  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "Reference genome options") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });

  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "Adapter trimming options") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });

  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "Alignment options") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });

  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "Peak calling options") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });

  document.querySelectorAll("label").forEach((label) => {
    if (label.textContent.trim() === "Process skipping options") {
      label.style.color = "green";
      label.style.fontWeight = "bold";
    }
  });
});
