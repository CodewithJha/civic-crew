// Matrix rain effect
function createMatrixRain() {
    const matrixContainer = document.getElementById('matrixRain');
    const chars = '01アイウエオカキクケコサシスセソタチツテト';
    const columns = Math.floor(window.innerWidth / 20);

    for (let i = 0; i < columns; i++) {
        const column = document.createElement('div');
        column.className = 'matrix-column';
        column.style.left = i * 20 + 'px';
        column.style.animationDelay = Math.random() * 10 + 's';
        column.style.animationDuration = (Math.random() * 10 + 5) + 's';
        
        let text = '';
        for (let j = 0; j < 20; j++) {
            text += chars[Math.floor(Math.random() * chars.length)] + '<br>';
        }
        column.innerHTML = text;
        
        matrixContainer.appendChild(column);
    }
}

// Smooth scrolling for hero section
document.addEventListener('DOMContentLoaded', function() {
    createMatrixRain();
    
    const scrollIndicator = document.querySelector('.scroll-indicator');
    const timelineSection = document.querySelector('.timeline-section');
    
    scrollIndicator.addEventListener('click', function() {
        timelineSection.scrollIntoView({ 
            behavior: 'smooth' 
        });
    });

    // Animate timeline items on scroll
    const timelineItems = document.querySelectorAll('.timeline-item');
    
    function animateTimelineItems() {
        timelineItems.forEach((item, index) => {
            const rect = item.getBoundingClientRect();
            const windowHeight = window.innerHeight;
            
            if (rect.top < windowHeight * 0.8) {
                setTimeout(() => {
                    item.classList.add('animate');
                }, index * 200);
            }
        });
    }

    // Initial check
    animateTimelineItems();
    
    // Check on scroll
    window.addEventListener('scroll', animateTimelineItems);

    // Video container interaction
    const videoContainer = document.querySelector('.video-container');
    const playBtn = document.querySelector('.play-btn');
    
    videoContainer.addEventListener('click', function() {
        playBtn.style.transform = 'scale(1.2)';
        setTimeout(() => {
            playBtn.style.transform = 'scale(1)';
        }, 200);
        
        // Add tech ripple effect
        const ripple = document.createElement('div');
        ripple.style.cssText = `
            position: absolute;
            border: 2px solid #00e5ff;
            border-radius: 10px;
            background: rgba(0, 229, 255, 0.1);
            transform: scale(0);
            animation: techRipple 0.6s linear;
            width: 100px;
            height: 100px;
            left: 50%;
            top: 50%;
            margin-left: -50px;
            margin-top: -50px;
        `;
        
        videoContainer.appendChild(ripple);
        
        setTimeout(() => {
            ripple.remove();
        }, 600);
    });

    // Add tech ripple animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes techRipple {
            to {
                transform: scale(4);
                opacity: 0;
                border-width: 1px;
            }
        }
    `;
    document.head.appendChild(style);

    // Hide scroll indicator when scrolled
    window.addEventListener('scroll', function() {
        const scrollY = window.scrollY;
        if (scrollY > 100) {
            scrollIndicator.style.opacity = '0';
        } else {
            scrollIndicator.style.opacity = '1';
        }
    });

    // Parallax effect for hero section
    window.addEventListener('scroll', function() {
        const scrolled = window.pageYOffset;
        const hero = document.querySelector('.hero');
        const rate = scrolled * -0.3;
        
        if (scrolled < window.innerHeight) {
            hero.style.transform = `translateY(${rate}px)`;
        }
    });
});
