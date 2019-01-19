<app>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 col-md-4 _it-left">
            <div class="card card-default">
                <div class="card-body p-0">

                    <!-- site head -->
                    <div class="mb-5 _it-site-head">
                        <h1 class="_it-heading text-lowercase">IpsumText</h1>
                        <p>The only placeholder text generator you will ever need.</p>
                    </div>
                    <!-- /site head -->

                    <!-- ipsum generator -->
                    <ipsum-generator></ipsum-generator>
                    <!-- /ipsum generator -->

                    <hr/>

                    <!-- site map menu -->
                    <div class="_it-site-map">
                        <h5 class="_it-heading mb-3">Site Map</h5>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">History of the ipsum text</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>
                    <!-- /site map menu -->

                    <!-- site footer links -->
                    <div class="_it-report-bug-link">
                        <hr/>
                        <a href="#"><i class="fas fa-bug"></i> Report a Bug</a>
                    </div>
                    <!-- /site footer links -->
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-8 _it-right">

            <div class="_it-lang-bar">
                <a href="#" class="btn btn-primary btn-sm">English</a>
                <!--  <a href="#" class="btn btn-outline-primary btn-sm">Sinhala</a>
                <a href="#" class="btn btn-outline-primary btn-sm">Hindhi</a>
                <a href="#" class="btn btn-outline-primary btn-sm">Tamil</a>  -->
            </div>

            <article class="_it-article" if={_.size(generatorData) > 0}>
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
            </article>
            <div each={_ipsumViewer in ipsumViewer}>
                <ipsum-viewer attr={_ipsumViewer}></ipsum-viewer>
            </div>
        </div>
    </div>
</div>

<script>
    let self = this;
    self.appAttr = self.opts;
    self.ipsumViewer = self.appAttr;

    self.handleCopyIpsum = (e) => {
        e.preventDefault();
    };
    

    self.on('mount', () => {
        self.mixin('commonMixin');

        self.store.on('generate_ipsum', (data) => {
            self.generatorData = data;
            self.id = data.id;
            self.text = data.text;
            new ClipboardJS('.bt-copy-btn-'+self.id);
            self.update();
        });
    });
</script>

</app>