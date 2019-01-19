<app>

    <div class="container py-3">
        <div class="row">
            <div class="col-lg-3 col-md-4">
                <ipsum-generator></ipsum-generator>
                <a href="#"><i class="fas fa-bug"></i> Report a Bug</a>
            </div>
            <div class="col-lg-9 col-md-8">
                <div class="card card-default mb-3" if={_.size(generatorData) > 0}>
                    <div class="card-body">

                        <ul class="nav nav-pills mb-3 it-pill-bar" id="pills-tab-{id}" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link btn active" id="pills-tab-{id}-text" data-toggle="pill" href="#pills-{id}-text" role="tab" aria-controls="pills-{id}-text"
                                    aria-selected="true"><i class="far fa-file-alt"></i> Text</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn" id="pills-tab-{id}-html" data-toggle="pill" href="#pills-{id}-html" role="tab" aria-controls="pills-{id}-html"
                                    aria-selected="false"><i class="fas fa-code"></i> HTML</a>
                            </li>
                        </ul>
                        <a href="#" 
                            class="btn btn-success mb-2 bt-copy-btn-{id}"
                            onclick={handleCopyIpsum} 
                            data-clipboard-target="#pills-tab-{id}-content .active .it-ipsum">
                            <i class="far fa-copy"></i> Copy</a>
                        <div class="tab-content" id="pills-tab-{id}-content">
                            <div class="tab-pane fade show active" id="pills-{id}-text" role="tabpanel" aria-labelledby="pills-tab-{id}-text">
                                <p if={!_.isArray(text)} class="it-ipsum">
                                    {text}
                                </p>
                                <span if={_.isArray(text)} class="it-ipsum">
                                    <p each={_para in text}>
                                        {_para}
                                    </p>
                                </span>
                            </div>
                            <div class="tab-pane fade" id="pills-{id}-html" role="tabpanel" aria-labelledby="pills-tab-{id}-html">
                                <span if={!_.isArray(text)} class="it-ipsum">
                                    <code>
                                        &lt;p&gt;{text}&lt;/p&gt;
                                    </code>
                                </span>
                                <span if={_.isArray(text)} class="it-ipsum">
                                    <code each={_para in text} style="display: block; margin-bottom: 1rem;">
                                        &lt;p&gt;{_para}&lt;/p&gt;
                                    </code>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div each={_ipsumViewer in ipsumViewer}>
                    <ipsum-viewer attr={_ipsumViewer}></ipsum-viewer>
                </div>
            </div>
        </div>
    </div>

<script>
    let self = this;
    self.appAttr = self.opts.attr;
    self.ipsumViewer = self.appAttr.ipsumViewer;

    
    self.handleCopyIpsum = (e) => {
        e.preventDefault();
        //let ipsum = $('#pills-tab-'+self.id+'-content .tab-pane.active .it-ipsum').text();
    };
    

    riot.store.on('generate_ipsum', (data) => {
        self.generatorData = data;
        self.id = data.id;
        self.text = data.text;
        new ClipboardJS('.bt-copy-btn-'+self.id);
        self.update();
    });

    self.on('mount', () => {
    });
</script>

</app>