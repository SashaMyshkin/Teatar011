
<div class="gallery">
    <div class="image">
        <img src="/assets/img/vecernja-ruza/kod-ekrema.jpg" alt="Image 1" onclick="openModal('/assets/img/vecernja-ruza/kod-ekrema.jpg')">
    </div>
    <div class="image">
        <img src="/assets/img/vecernja-ruza/ubistvo.jpg" alt="Image 2" onclick="openModal('/assets/img/vecernja-ruza/ubistvo.jpg')">
    </div>
    <div class="image">
        <img src="/assets/img/vecernja-ruza/poster.png" alt="Image 2" onclick="openModal('/assets/img/vecernja-ruza/poster.png')">
    </div>
    <!-- Add more images as needed -->
</div>

<div id="modal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <img id="modalImage" class="modal-content" src="" alt="Modal Image" style="width:100%">
</div>

<script>
    // Function to open modal with clicked image
    function openModal(imageSrc) {
        var modal = document.getElementById("modal");
        var modalImg = document.getElementById("modalImage");
        modal.style.display = "block";
        modalImg.src = imageSrc;
        modalImg.width = "100%"
    }

    // Function to close modal
    function closeModal() {
        var modal = document.getElementById("modal");
        modal.style.display = "none";
    }
</script>