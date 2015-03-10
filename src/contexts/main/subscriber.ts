import d = require('./defs')
import Sub = require('../sub/index');
declare var App: any;

var subscriber = Arda.subscriber<d.Props, d.State>((context, subscribe) => {
  subscribe('main:go-to-sub', () => {
    App.router.pushContext(Sub, {});
  });
  subscribe('context:set-contents-height', (contentsHeight) => {
    context.update(() => {
      return {contentsHeight: contentsHeight};
    });
  });
});


export = subscriber;
