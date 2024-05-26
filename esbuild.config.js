const esbuild = require('esbuild');

const options = {
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  outdir: 'app/assets/builds',
  loader: { '.js': 'jsx' }
};

if (process.argv.includes('--watch')) {
  esbuild.context(options).then(ctx => {
    ctx.watch().catch(() => process.exit(1));
  });
} else {
  esbuild.build(options).catch(() => process.exit(1));
}
