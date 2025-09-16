// Simple interactive feature
document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".card");
    cards.forEach(card => {
        card.addEventListener("click", () => {
            alert(`You clicked: ${card.querySelector("h3").innerText}`);
        });
    });
});
// IntersectionObserver for timeline reveal and icon emphasis
(() => {
    const items = Array.from(document.querySelectorAll('.timeline-item'));
    if (!('IntersectionObserver' in window) || items.length === 0) return;

    const onEnter = (entry, item) => {
        if (entry.isIntersecting) {
            item.classList.add('inview');
        } else {
            item.classList.remove('inview');
        }
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
            const item = entry.target;
            onEnter(entry, item);
        });
    }, { root: null, threshold: 0.35 });

    items.forEach((item) => observer.observe(item));
})();

// Scroll progress dot on the timeline
(() => {
    const timeline = document.querySelector('.timeline');
    if (!timeline) return;

    const updateProgress = () => {
        const rect = timeline.getBoundingClientRect();
        const viewport = window.innerHeight || document.documentElement.clientHeight;
        const total = rect.height;
        const visibleTop = Math.min(Math.max(0, viewport - rect.top), total);
        const progress = Math.max(0, Math.min(1, visibleTop / total));
        const percent = (progress * 100).toFixed(2) + '%';
        timeline.style.setProperty('--progress', percent);
    };

    updateProgress();
    window.addEventListener('scroll', updateProgress, { passive: true });
    window.addEventListener('resize', updateProgress);
})();
document.querySelectorAll(".timeline-icon").forEach(icon => {
    icon.addEventListener("click", () => {
        alert("Step: " + icon.parentElement.querySelector("h3").innerText);
    });
});

// Header darken on scroll and active nav state
(() => {
    const header = document.querySelector('header');
    const links = Array.from(document.querySelectorAll('header .nav a'));
    if (!header) return;
    const onScroll = () => {
        if (window.scrollY > 8) header.classList.add('scrolled');
        else header.classList.remove('scrolled');
    };
    onScroll();
    window.addEventListener('scroll', onScroll, { passive: true });
    // mark active if href matches current path basename
    const path = location.pathname.split('/').pop();
    links.forEach(a => {
        const href = (a.getAttribute('href') || '').replace(/^\//,'');
        if (href === path) a.classList.add('active');
    });
})();
