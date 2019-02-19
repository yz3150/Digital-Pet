<pet>
  <h1>Doraemon</h1>
  <p>Doraemon is your digital pet. He is your friend and also serves you. The goal is to make him like you.</p>
<div>
    <img src="{ petImage }" ref="pet" style="">
</div>


  <div>
    <div class="bar likes">
      <div style="width:{ petLikes }%;">&nbsp;</div>
    </div>
    <p>LIKES: { petLikes }</p>
  </div>

  <div>
    <div class="bar cleaness">
      <div style="width:{ houseCleaness }%;">&nbsp;</div>
    </div>
    <p>CLEANESS:{ houseCleaness }</p>
  </div>
  <div class="buttongroup">
    <button type="button" name="Feed Dorayaki" onclick={ feedDorayaki } disabled={}>Feed him Dorayaki <br/>(total { food } left)</button>
    <button type="button" name="Have Doraemon Clean" onclick={ cleanHouse } disabled={}>Let him clean the house</button>

  </div>


  <script>
    var tags = this;

    var TOTALLIKES = 100;
    var TOTALLCLEANESS = 100;

    this.food = 40;

    this.petLikes = 0;
    this.houseCleaness = 50;

    this.petImage = "../assets/like-00.gif";

    feedDorayaki(event) {
      this.petLikes = this.petLikes + 20;
      this.houseCleaness = this.houseCleaness - 10;
      this.food =  this.food - 1;
      this.checkHateBar();
      this.checkLikeBar();
      this.updateLikeImage();

    if (this.houseCleaness < 30) {
      this.petImage ="../assets/mice.jpeg";
      this.petLikes = this.petLikes -40;
      this.food =  this.food -10;
      this.cleaness = this.cleaness -10;
    }
    }

    cleanHouse(event) {
      this.houseCleaness = this.houseCleaness + 10;
      this.petLikes = this.petLikes - 10;
      this.checkLikeBar();
      this.checkHateBar();
      this.updateHateImage();
    }

    updateLikeImage(event) {
      if (this.petLikes >= (TOTALLIKES*0.8)) {
        this.petImage = "../assets/like-04.gif";
    } else if (this.petLikes >= (TOTALLIKES*0.6)) {
        this.petImage = "../assets/like-03.gif";
    } else if (this.petLikes >= (TOTALLIKES*0.4)) {
        this.petImage ="../assets/like-02.gif";
    } else if (this.petLikes >= (TOTALLIKES*0.2)) {
      this.petImage = "../assets/like-01.gif";
    } else {
      this.petImage = "../assets/like-00.gif";
    }}

    updateHateImage(event) {
      if(this.houseCleaness >= (TOTALLCLEANESS*0.8)) {
        this.petImage = "../assets/hate-04.gif";
    } else if (this.houseCleaness >= (TOTALLCLEANESS*0.6)) {
        this.petImage = "../assets/hate-03.gif";
    } else if (this.houseCleaness >= (TOTALLCLEANESS*0.4)) {
        this.petImage = "../assets/hate-02.gif";
    } else if (this.houseCleaness >= (TOTALLCLEANESS*0.2)) {
      this.petImage = "../assets/hate-01.gif";
    } else {
      this.petImage = "../assets/like-00.gif";
    }}

    checkLikeBar(event) {
      if (this.petLikes < 0) {
        this.petLikes = 0;
      } else if (this.petLikes >= 100) {
        this.petLikes = 100;
      } else {
        this.petLikes = this.petLikes;
      }
    }

    checkHateBar(event) {
      if (this.houseCleaness < 0) {
        this.houseCleaness = 0;
      } else if (this.houseCleaness >= 100) {
        this.houseCleaness = 100;
      } else {
        this.houseCleaness = this.houseCleaness;
      }
    }

  </script>

  <style>
  :scope {
    font-size: 1.5em;
    font-family: sans-serif;
    text-align: center;
  }

  img {
    height: 300px;
  }

  .bar {
    width: 100%;
    border: 1px solid grey;
    text-align: left;
  }
  .bar > div {
    transition: width 1s;
  }

  .bar.likes > div {
  background-color: dodgerblue;
}


  .bar.cleaness > div {
  background-color: yellow;
}

button {
  font-size: 1em;
  padding: 0.4em;
  border-radius: 0.25em;
  background-color: coral;
  border: 1px solid navy;
  cursor: pointer;
  width: 300px;
  margin-left: 30px;
  margin-right: 30px;
}

.buttongroup {
  text-align: center;
}


  </style>
</pet>
