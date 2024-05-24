{{flutter_js}}
{{flutter_build_config}}

// Create a container for the loader
const container = document.createElement("div");
container.style.display = "flex";
container.style.justifyContent = "center";
container.style.alignItems = "center";
container.style.height = "100vh"; // Full height of the viewport

const loading = document.createElement("div");
loading.style.border = "16px solid #f3f3f3"; // Light grey
loading.style.borderTop = "16px solid #3498db"; // Blue
loading.style.borderRadius = "50%";
loading.style.width = "120px";
loading.style.height = "120px";
loading.style.animation = "spin 2s linear infinite";

container.appendChild(loading);
document.body.appendChild(container);

// Add CSS for spin animation
const style = document.createElement("style");
style.textContent = `
  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
`;
document.head.appendChild(style);

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();
  },
});
