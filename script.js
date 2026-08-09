// ================================
// Smooth navigation
// ================================

document.querySelectorAll('a[href^="#"]').forEach(link => {

    link.addEventListener("click", function (event) {

        event.preventDefault();

        const target = document.querySelector(this.getAttribute("href"));

        if (target) {
            target.scrollIntoView({
                behavior: "smooth"
            });
        }

    });

});


// ================================
// Current year in footer
// ================================

const year = new Date().getFullYear();

const footerParagraphs = document.querySelectorAll("footer p");

if (footerParagraphs.length > 0) {

    footerParagraphs[0].textContent =
        `AWS Cloud Portfolio © ${year}`;

}