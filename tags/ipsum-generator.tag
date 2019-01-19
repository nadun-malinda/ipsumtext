<ipsum-generator>

    <div class="card card-default mb-3">
        <div class="card-body">
            <h5 class="card-title text-uppercase">Generate Ipsum</h5>
            <form onsubmit={handleSubmit}>
                <div class="form-group">
                    <input type="number" min="1" value="5" class="form-control" ref="ipsumCount">
                </div>
                <div class="form-group">
                    <select class="form-control" ref="ipsumType">
                        <option value="1">Words</option>
                        <option value="2">Sentences</option>
                        <option value="3">Paragraphs</option>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Generate</button>
                </div>
            </form>
        </div>
    </div>

    <script>
    let self = this;
    self.arrText = [];

    self.sentenceGenerator = (arrWords, ipsumCount) => {
        let i;
        let arrShuffledWords = [];
        let strNewText = '';

        for (i=0; i < ipsumCount; i++) {
            arrShuffledWords = _.slice(_.shuffle(arrWords), 0, _.random(8, 20));
            strNewText += _.capitalize(_.join(arrShuffledWords, ' ')) + '. ';
        }

        return strNewText;
    };

    self.generator = (ipsumCount, ipsumType) => {
        self.textfromFile = self.parent.ipsumViewer[0].text;
        let arrWords = _.words(self.textfromFile);
        let arrShuffledWords = [];
        let strNewText;

        if (ipsumType == 1) {
            //if words
            arrShuffledWords = _.slice(_.shuffle(arrWords), 0, ipsumCount);
            strNewText = _.join(arrShuffledWords, ' ');

        } else if (ipsumType == 2) {
            //if sentence
            strNewText = self.sentenceGenerator(arrWords, ipsumCount);
        } else if (ipsumType == 3) {
            //if paragraph
            let i;
            strNewText = [];
            for (i=0; i < ipsumCount; i++) {
                strNewText.push(self.sentenceGenerator(arrWords, _.random(3, 7)));
            }
        } 

        return strNewText;
    };

    self.handleSubmit = (e) => {
        e.preventDefault();
        let ipsumCount = self.refs.ipsumCount.value;
        let ipsumType = self.refs.ipsumType.value;

        riot.store.trigger('generate_ipsum', {
            id: 0,
            text: self.generator(ipsumCount, ipsumType)
        });
    };

    self.on('mount', () => {
        
    });
    </script>

</ipsum-generator>