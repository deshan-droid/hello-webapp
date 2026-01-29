<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>DevOps & CI/CD Pipeline</title>
  <meta name="description" content="A modern one-page website about DevOps and CI/CD pipelines." />
  <style>
    :root{
      --bg: #0b1020;
      --panel: rgba(255,255,255,.06);
      --panel2: rgba(255,255,255,.09);
      --text: rgba(255,255,255,.92);
      --muted: rgba(255,255,255,.72);
      --line: rgba(255,255,255,.14);
      --accent: #7c3aed;
      --accent2:#22d3ee;
      --ok:#34d399;
      --warn:#fb7185;
      --shadow: 0 18px 60px rgba(0,0,0,.45);
      --radius: 18px;
      --radius2: 26px;
      --max: 1120px;
      --mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
      --sans: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, "Apple Color Emoji", "Segoe UI Emoji";
    }

    *{ box-sizing:border-box }
    html,body{ height:100% }
    body{
      margin:0;
      font-family:var(--sans);
      color:var(--text);
      background:
        radial-gradient(1200px 600px at 20% -10%, rgba(124,58,237,.45), transparent 60%),
        radial-gradient(900px 500px at 90% 10%, rgba(34,211,238,.35), transparent 55%),
        radial-gradient(900px 500px at 40% 110%, rgba(52,211,153,.18), transparent 60%),
        var(--bg);
      overflow-x:hidden;
    }

    a{ color:inherit; text-decoration:none }
    .wrap{ max-width:var(--max); margin:0 auto; padding:26px 18px 70px }

    /* Top nav */
    .nav{
      position:sticky; top:0; z-index:50;
      backdrop-filter: blur(10px);
      background: linear-gradient(to bottom, rgba(11,16,32,.85), rgba(11,16,32,.55));
      border-bottom: 1px solid rgba(255,255,255,.08);
    }
    .nav-inner{
      max-width:var(--max);
      margin:0 auto;
      padding:14px 18px;
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:14px;
    }
    .brand{
      display:flex; align-items:center; gap:10px;
      font-weight:800; letter-spacing:.2px;
    }
    .logo{
      width:38px; height:38px; border-radius:12px;
      background: conic-gradient(from 210deg, var(--accent), var(--accent2), var(--ok), var(--accent));
      box-shadow: 0 10px 30px rgba(124,58,237,.25);
      position:relative;
    }
    .logo:after{
      content:"";
      position:absolute; inset:9px;
      border-radius:10px;
      background: rgba(0,0,0,.18);
      border: 1px solid rgba(255,255,255,.15);
    }
    .nav-links{ display:flex; gap:14px; flex-wrap:wrap; justify-content:flex-end }
    .nav-links a{
      font-size:14px;
      padding:9px 12px;
      border-radius:12px;
      border: 1px solid transparent;
      color: var(--muted);
    }
    .nav-links a:hover{
      color: var(--text);
      background: rgba(255,255,255,.06);
      border-color: rgba(255,255,255,.10);
    }

    /* Hero */
    .hero{
      padding:52px 0 20px;
      display:grid;
      grid-template-columns: 1.15fr .85fr;
      gap:22px;
      align-items:stretch;
    }
    @media (max-width: 900px){
      .hero{ grid-template-columns: 1fr; padding-top:30px }
    }

    .card{
      background: linear-gradient(180deg, rgba(255,255,255,.08), rgba(255,255,255,.04));
      border: 1px solid rgba(255,255,255,.10);
      border-radius: var(--radius2);
      box-shadow: var(--shadow);
    }

    .hero-left{ padding:26px 24px }
    .kicker{
      display:inline-flex; align-items:center; gap:10px;
      font-size:13px;
      padding:8px 12px;
      border-radius:999px;
      background: rgba(124,58,237,.12);
      border: 1px solid rgba(124,58,237,.30);
      color: rgba(255,255,255,.84);
    }
    .dot{
      width:9px; height:9px; border-radius:50%;
      background: radial-gradient(circle, var(--ok), rgba(52,211,153,.2));
      box-shadow: 0 0 0 4px rgba(52,211,153,.12);
    }
    h1{
      margin:16px 0 10px;
      font-size: clamp(30px, 4vw, 48px);
      line-height:1.07;
      letter-spacing:-.6px;
    }
    .sub{
      margin:0 0 18px;
      color: var(--muted);
      line-height:1.55;
      font-size: 16px;
      max-width: 62ch;
    }

    .cta-row{
      display:flex;
      gap:12px;
      flex-wrap:wrap;
      margin-top:16px;
    }
    .btn{
      display:inline-flex; align-items:center; justify-content:center;
      gap:10px;
      padding:11px 14px;
      border-radius:14px;
      border: 1px solid rgba(255,255,255,.12);
      background: rgba(255,255,255,.06);
      color: var(--text);
      font-weight:650;
      font-size:14px;
      cursor:pointer;
      transition: transform .15s ease, background .15s ease, border-color .15s ease;
      user-select:none;
    }
    .btn:hover{ transform: translateY(-1px); background: rgba(255,255,255,.09); border-color: rgba(255,255,255,.18) }
    .btn.primary{
      background: linear-gradient(135deg, rgba(124,58,237,.95), rgba(34,211,238,.60));
      border-color: rgba(255,255,255,.15);
      box-shadow: 0 12px 36px rgba(124,58,237,.25);
    }
    .btn.primary:hover{ background: linear-gradient(135deg, rgba(124,58,237,1), rgba(34,211,238,.68)) }

    /* Right hero panel: pipeline mini */
    .hero-right{ padding:22px 20px; position:relative; overflow:hidden }
    .hero-right:before{
      content:"";
      position:absolute; inset:-40px;
      background: radial-gradient(600px 240px at 20% 20%, rgba(124,58,237,.25), transparent 60%),
                  radial-gradient(520px 220px at 80% 10%, rgba(34,211,238,.18), transparent 60%);
      pointer-events:none;
      transform: rotate(-6deg);
    }
    .hero-right .inner{ position:relative }
    .panel-title{
      display:flex; align-items:flex-start; justify-content:space-between; gap:10px;
      margin-bottom:14px;
    }
    .panel-title h2{
      margin:0;
      font-size:16px;
      letter-spacing:.2px;
    }
    .badge{
      font-family:var(--mono);
      font-size:12px;
      color: rgba(255,255,255,.78);
      padding:7px 10px;
      border-radius:999px;
      background: rgba(255,255,255,.06);
      border: 1px solid rgba(255,255,255,.12);
      white-space:nowrap;
    }

    .pipe{
      display:grid;
      gap:10px;
      margin-top:14px;
    }
    .step{
      display:grid;
      grid-template-columns: 34px 1fr auto;
      align-items:center;
      gap:12px;
      padding:12px 12px;
      border-radius:16px;
      border: 1px solid rgba(255,255,255,.10);
      background: rgba(0,0,0,.12);
    }
    .icon{
      width:34px; height:34px;
      border-radius:14px;
      display:grid; place-items:center;
      background: rgba(255,255,255,.08);
      border: 1px solid rgba(255,255,255,.12);
      font-family: var(--mono);
      font-weight:700;
      color: rgba(255,255,255,.86);
    }
    .meta{ line-height:1.2 }
    .meta b{ display:block; font-size:14px }
    .meta span{ font-size:12px; color: var(--muted) }
    .pill{
      font-size:12px;
      padding:6px 10px;
      border-radius:999px;
      border: 1px solid rgba(255,255,255,.12);
      background: rgba(255,255,255,.06);
      color: rgba(255,255,255,.80);
      font-family: var(--mono);
    }
    .pill.ok{ border-color: rgba(52,211,153,.28); background: rgba(52,211,153,.10) }
    .pill.warn{ border-color: rgba(251,113,133,.30); background: rgba(251,113,133,.10) }

    /* Sections */
    section{ margin-top:30px }
    .section-head{
      display:flex; align-items:flex-end; justify-content:space-between;
      gap:16px; flex-wrap:wrap;
      margin: 26px 0 12px;
    }
    .section-head h3{
      margin:0;
      font-size:20px;
      letter-spacing:-.2px;
    }
    .section-head p{
      margin:0;
      color:var(--muted);
      max-width: 70ch;
      line-height:1.5;
      font-size:14px;
    }

    .grid{
      display:grid;
      grid-template-columns: repeat(3, 1fr);
      gap:14px;
    }
    @media (max-width: 950px){ .grid{ grid-template-columns: 1fr 1fr } }
    @media (max-width: 640px){ .grid{ grid-template-columns: 1fr } }

    .mini{
      padding:18px 16px;
      border-radius: var(--radius);
      background: rgba(255,255,255,.05);
      border: 1px solid rgba(255,255,255,.10);
    }
    .mini h4{
      margin:0 0 8px;
      font-size:15px;
      letter-spacing:-.1px;
      display:flex; align-items:center; gap:10px;
    }
    .mini p{
      margin:0;
      color: var(--muted);
      line-height:1.55;
      font-size:14px;
    }
    .spark{
      width:11px; height:11px; border-radius:4px;
      background: linear-gradient(135deg, var(--accent), var(--accent2));
      box-shadow: 0 0 0 4px rgba(124,58,237,.10);
    }

    /* Timeline */
    .timeline{
      display:grid;
      grid-template-columns: 1fr 1fr;
      gap:14px;
    }
    @media (max-width: 880px){ .timeline{ grid-template-columns: 1fr } }

    .lane{
      padding:18px 16px;
      border-radius: var(--radius);
      background: rgba(255,255,255,.05);
      border: 1px solid rgba(255,255,255,.10);
    }
    .lane h4{ margin:0 0 12px; font-size:15px; display:flex; align-items:center; gap:10px }
    .tag{
      font-family:var(--mono);
      font-size:12px;
      padding:4px 8px;
      border-radius:999px;
      background: rgba(255,255,255,.06);
      border: 1px solid rgba(255,255,255,.12);
      color: rgba(255,255,255,.82);
    }

    .items{ display:grid; gap:10px; margin-top:10px }
    .item{
      padding:12px 12px;
      border-radius:16px;
      background: rgba(0,0,0,.12);
      border: 1px solid rgba(255,255,255,.10);
    }
    .item b{ display:block; font-size:14px; margin-bottom:4px }
    .item span{ color:var(--muted); font-size:13px; line-height:1.45 }

    /* Code box */
    .code{
      margin-top:12px;
      border-radius: var(--radius);
      background: rgba(0,0,0,.25);
      border: 1px solid rgba(255,255,255,.12);
      overflow:hidden;
    }
    .code-head{
      display:flex; justify-content:space-between; align-items:center;
      padding:10px 12px;
      background: rgba(255,255,255,.06);
      border-bottom: 1px solid rgba(255,255,255,.10);
      color: rgba(255,255,255,.78);
      font-family: var(--mono);
      font-size:12px;
    }
    pre{
      margin:0;
      padding:12px;
      overflow:auto;
      color: rgba(255,255,255,.88);
      font-family: var(--mono);
      font-size:12.5px;
      line-height:1.55;
    }
    .copy{
      border: 1px solid rgba(255,255,255,.14);
      background: rgba(255,255,255,.06);
      color: rgba(255,255,255,.82);
      border-radius:12px;
      padding:7px 10px;
      cursor:pointer;
      font-family: var(--mono);
      font-size:12px;
    }
    .copy:hover{ background: rgba(255,255,255,.09) }

    footer{
      margin-top:34px;
      padding-top:18px;
      border-top: 1px solid rgba(255,255,255,.10);
      color: var(--muted);
      display:flex;
      justify-content:space-between;
      align-items:center;
      gap:14px;
      flex-wrap:wrap;
      font-size:13px;
    }
    .kbd{
      font-family: var(--mono);
      font-size:12px;
      padding:3px 8px;
      border-radius:10px;
      border: 1px solid rgba(255,255,255,.14);
      background: rgba(255,255,255,.06);
      color: rgba(255,255,255,.82);
    }
  </style>
</head>

<body>
  <div class="nav">
    <div class="nav-inner">
      <div class="brand">
        <div class="logo" aria-hidden="true"></div>
        <div>
          <div style="font-size:14px; line-height:1.1;">DevOps & CI/CD</div>
          <div style="font-size:12px; color:rgba(255,255,255,.65); line-height:1.1;">Modern delivery, minimal drama</div>
        </div>
      </div>

      <div class="nav-links">
        <a href="#devops">DevOps</a>
        <a href="#cicd">CI/CD</a>
        <a href="#pipeline">Pipeline</a>
        <a href="#jenkinsfile">Jenkinsfile</a>
      </div>
    </div>
  </div>

  <div class="wrap">
    <header class="hero">
      <div class="card hero-left">
        <div class="kicker"><span class="dot"></span> Ship faster. Break less. Sleep more 😌</div>
        <h1>DevOps & CI/CD Pipeline</h1>
        <p class="sub">
          DevOps is a culture + set of practices that brings developers and operations together.
          A CI/CD pipeline is the automated “assembly line” that builds, tests, and deploys your app reliably.
        </p>

        <div class="cta-row">
          <a class="btn primary" href="#pipeline">Explore the pipeline →</a>
          <a class="btn" href="#jenkinsfile">See a Jenkinsfile</a>
          <a class="btn" href="#cicd">CI vs CD explained</a>
        </div>

        <div style="margin-top:18px; display:flex; gap:10px; flex-wrap:wrap;">
          <span class="pill ok">automation</span>
          <span class="pill">version control</span>
          <span class="pill">testing</span>
          <span class="pill">monitoring</span>
          <span class="pill warn">rollback-ready</span>
        </div>
      </div>

      <aside class="card hero-right" aria-label="Mini pipeline">
        <div class="inner">
          <div class="panel-title">
            <h2>Pipeline snapshot</h2>
            <span class="badge">CI/CD • end-to-end</span>
          </div>

          <div class="pipe" id="pipeline">
            <div class="step">
              <div class="icon">01</div>
              <div class="meta">
                <b>Commit</b>
                <span>Push code to Git</span>
              </div>
              <span class="pill">git</span>
            </div>

            <div class="step">
              <div class="icon">02</div>
              <div class="meta">
                <b>Build</b>
                <span>Maven/Gradle creates artifact</span>
              </div>
              <span class="pill">.war</span>
            </div>

            <div class="step">
              <div class="icon">03</div>
              <div class="meta">
                <b>Test</b>
                <span>Unit + integration checks</span>
              </div>
              <span class="pill ok">pass</span>
            </div>

            <div class="step">
              <div class="icon">04</div>
              <div class="meta">
                <b>Deploy</b>
                <span>Ship to server/container</span>
              </div>
              <span class="pill">prod</span>
            </div>

            <div class="step">
              <div class="icon">05</div>
              <div class="meta">
                <b>Observe</b>
                <span>Logs, metrics, alerts</span>
              </div>
              <span class="pill">SRE</span>
            </div>
          </div>
        </div>
      </aside>
    </header>

    <section id="devops">
      <div class="section-head">
        <div>
          <h3>What is DevOps?</h3>
          <p>DevOps is not a tool — it’s a way of working that makes delivery predictable, repeatable, and fast.</p>
        </div>
      </div>

      <div class="grid">
        <div class="mini">
          <h4><span class="spark"></span> Culture</h4>
          <p>Shared ownership: dev + ops work together, with clear responsibilities and fewer handover problems.</p>
        </div>
        <div class="mini">
          <h4><span class="spark"></span> Automation</h4>
          <p>Automate builds, tests, deployments, and infrastructure changes to reduce human error.</p>
        </div>
        <div class="mini">
          <h4><span class="spark"></span> Feedback loops</h4>
          <p>Monitoring + alerts + logs help you detect issues early and improve continuously.</p>
        </div>
      </div>
    </section>

    <section id="cicd">
      <div class="section-head">
        <div>
          <h3>CI vs CD (simple & clear)</h3>
          <p>These terms get mixed up. Here’s the clean version you can explain in an interview.</p>
        </div>
      </div>

      <div class="timeline">
        <div class="lane">
          <h4>Continuous Integration <span class="tag">CI</span></h4>
          <div class="items">
            <div class="item">
              <b>Goal</b>
              <span>Merge code often and verify it automatically.</span>
            </div>
            <div class="item">
              <b>Typical steps</b>
              <span>Checkout → Build → Unit Tests → Static checks → Artifact creation.</span>
            </div>
            <div class="item">
              <b>Result</b>
              <span>A tested artifact (like a <span style="font-family:var(--mono)">.war</span> or <span style="font-family:var(--mono)">.jar</span>).</span>
            </div>
          </div>
        </div>

        <div class="lane">
          <h4>Continuous Delivery/Deployment <span class="tag">CD</span></h4>
          <div class="items">
            <div class="item">
              <b>Continuous Delivery</b>
              <span>Artifact is always ready to deploy (often needs a manual approval).</span>
            </div>
            <div class="item">
              <b>Continuous Deployment</b>
              <span>If tests pass, it goes to production automatically (no manual step).</span>
            </div>
            <div class="item">
              <b>Safety</b>
              <span>Use rollbacks, blue/green, canary releases, feature flags.</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="jenkinsfile">
      <div class="section-head">
        <div>
          <h3>A simple Jenkinsfile example</h3>
          <p>This is a clean beginner-friendly pipeline for a Java webapp that builds a WAR and deploys to Tomcat.</p>
        </div>
        <button class="copy" id="copyBtn" type="button">Copy</button>
      </div>

      <div class="code" aria-label="Jenkinsfile code block">
        <div class="code-head">
          <span>Jenkinsfile (Declarative Pipeline)</span>
          <span class="kbd">Ctrl</span> + <span class="kbd">C</span>
        </div>
        <pre id="codeBlock">pipeline {
  agent any

  environment {
    TOMCAT_WEBAPPS = "/var/lib/tomcat9/webapps"
    WAR_NAME = "hello-webapp.war"
  }

  stages {
    stage("Checkout") {
      steps {
        checkout scm
      }
    }

    stage("Build") {
      steps {
        sh "mvn -v"
        sh "mvn clean package -DskipTests=false"
      }
    }

    stage("Test") {
      steps {
        sh "mvn test"
      }
    }

    stage("Deploy to Tomcat") {
      steps {
        sh """
          echo "Deploying WAR..."
          sudo cp target/*.war ${TOMCAT_WEBAPPS}/${WAR_NAME}
          sudo systemctl restart tomcat9
          echo "Done. Try: http://&lt;server-ip&gt;:8080/hello-webapp/"
        """
      }
    }
  }

  post {
    success { echo "✅ Pipeline succeeded!" }
    failure { echo "❌ Pipeline failed. Check console output." }
  }
}</pre>
      </div>

      <div style="margin-top:12px; color:var(--muted); font-size:14px; line-height:1.55;">
        <b style="color:rgba(255,255,255,.88);">Tip:</b>
        In real production, avoid restarting Tomcat every time. You’d use safer strategies like
        <span style="color:rgba(255,255,255,.86);">rolling deploys</span> or
        <span style="color:rgba(255,255,255,.86);">blue/green</span>, and permissions via a controlled service account.
      </div>
    </section>

    <footer>
      <div>Built for learning — DevOps mindset + clean delivery</div>
      
    </footer>
  </div>

  <script>
    // Smooth scroll
    document.querySelectorAll('a[href^="#"]').forEach(a => {
      a.addEventListener('click', (e) => {
        const id = a.getAttribute('href');
        const el = document.querySelector(id);
        if (!el) return;
        e.preventDefault();
        el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      });
    });

    // Copy Jenkinsfile
    const copyBtn = document.getElementById("copyBtn");
    const codeBlock = document.getElementById("codeBlock");
    copyBtn.addEventListener("click", async () => {
      try {
        await navigator.clipboard.writeText(codeBlock.innerText);
        copyBtn.textContent = "Copied ✅";
        setTimeout(() => (copyBtn.textContent = "Copy"), 1200);
      } catch (err) {
        alert("Copy failed. Please copy manually.");
      }
    });
  </script>
</body>
</html>
