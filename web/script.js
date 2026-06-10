// script.js
document.addEventListener("DOMContentLoaded", function() {
    
    // 1. Interaktivitas Pilihan Kotak di Halaman Konseling
    const tiles = document.querySelectorAll(".radio-tile-group .tile");
    tiles.forEach(tile => {
        tile.addEventListener("click", function() {
            // Hapus kelas active dari semua pilihan kotak
            tiles.forEach(t => {
                t.style.background = "white";
                t.style.color = "#333";
                t.style.fontWeight = "normal";
            });
            
            // Tambahkan efek aktif ke kotak yang diklik
            this.style.background = "#e3f2fd";
            this.style.color = "#1565c0";
            this.style.fontWeight = "bold";
        });
    });

    // 2. Simulasi Fitur Pencarian di Topbar
    const searchInput = document.querySelector(".search-box input");
    if(searchInput) {
        searchInput.addEventListener("keypress", function(e) {
            if (e.key === "Enter") {
                alert("Mencari layanan: " + this.value);
            }
        });
    }
});