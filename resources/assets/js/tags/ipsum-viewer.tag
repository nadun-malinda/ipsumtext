<ipsum-viewer>

    <article class="_it-article">
        <div class="card card-default">
            <div class="card-body p-0">

                <ul class="nav nav-pills mb-3 it-pill-bar" id="pills-tab-{id}" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="pills-tab-{id}-text" data-toggle="pill" href="#pills-{id}-text" role="tab" aria-controls="pills-{id}-text"
                            aria-selected="true"><i class="far fa-file-alt"></i> Text</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-tab-{id}-html" data-toggle="pill" href="#pills-{id}-html" role="tab" aria-controls="pills-{id}-html"
                            aria-selected="false"><i class="fas fa-code"></i> HTML</a>
                    </li>
                </ul>
                <a href="#" 
                    class="btn btn-success mb-2 bt-copy-btn-{id}" 
                    onclick={parent.handleCopyIpsum} 
                    data-clipboard-target="#pills-tab-{id}-content .active .it-ipsum">
                    <i class="far fa-copy"></i> Copy</a>
                <div class="tab-content" id="pills-tab-{id}-content">
                    <div class="tab-pane fade show active" id="pills-{id}-text" role="tabpanel" aria-labelledby="pills-tab-{id}-text">
                        <p class="it-ipsum">{text}</p>
                    </div>
                    <div class="tab-pane fade" id="pills-{id}-html" role="tabpanel" aria-labelledby="pills-tab-{id}-html">
                        <code class="it-ipsum">&lt;p&gt;{text}&lt;/p&gt;</code>
                    </div>
                </div>
            </div>
        </div>
    </article>

    <script>
    let self = this;
    self.tagAttr = self.opts.attr;
    self.id = self.tagAttr.id;
    self.text = self.tagAttr.text;

    self.on('mount', () => {
        new ClipboardJS('.bt-copy-btn-'+self.id);
    });
    </script>

</ipsum-viewer>