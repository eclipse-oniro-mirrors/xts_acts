import jsLeakWatcher from '@ohos.hiviewdfx.jsLeakWatcher';
import { describe, it, expect, Level } from '@ohos/hypium'
export default function jsLeakWatcher1() {
  describe('jsLeakWatcher', () => {
    /**
     * @tc.name   jsLeakWatcher
     * @tc.number SUB_jsLeakWatcher
     * @tc.desc   enableLeakWatcher函数异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('jsLeakWatcher', Level.LEVEL0, async (done:Function)  => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1000 start");
      try {
        jsLeakWatcher.enableLeakWatcher(true, null, (filepath : Array<string>) => {
          console.log('testJsLeakWatcher leakListFileName: ' + filepath[0]);
          console.log('testJsLeakWatcher heapDumpFileName: ' + filepath[1]);
        });
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_1000 config undefined')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 10801002).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_1000 end");
    })
  })
}

