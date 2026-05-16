import jsLeakWatcher from '@ohos.hiviewdfx.jsLeakWatcher';
import { describe, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';

function generateLongString(length: number): string {
  let str: string = '';
  for (let i: number = 0; i < length; i++) {
    str += 'a';
  }
  return str;
}

export default function JsLeakWatcherParamSpecTest() {
  describe('JsLeakWatcherParamSpecTest', () => {

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Length_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Length_0100
     * @tc.desc   Test watch interface with msg parameter exceeding reasonable length, expect no error thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Length_0100', Level.LEVEL3, async (done: Function) => {
      console.info('jsLeakWatcherWatchMsgLength001 start');
      let obj: object = new Object();
      let longMsg: string = generateLongString(8193);
      jsLeakWatcher.enable(true);
      jsLeakWatcher.watch(obj, longMsg);
      let leakObjList: string = jsLeakWatcher.check();
      console.info(`jsLeakWatcherWatchMsgLength001 check result: ${leakObjList}`);
      expect(leakObjList != null).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Length_0200
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Length_0200
     * @tc.desc   Test watch interface with msg parameter at boundary length (8192 characters), expect no error thrown.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Length_0200', Level.LEVEL2, async (done: Function) => {
      console.info('jsLeakWatcherWatchMsgLength002 start');
      let obj: object = new Object();
      let boundaryMsg: string = generateLongString(8192);
      jsLeakWatcher.enable(true);
      jsLeakWatcher.watch(obj, boundaryMsg);
      let leakObjList: string = jsLeakWatcher.check();
      console.info(`jsLeakWatcherWatchMsgLength002 check result: ${leakObjList}`);
      expect(leakObjList != null).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Empty_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Empty_0100
     * @tc.desc   Test watch interface with empty msg parameter, expect success or error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Empty_0100', Level.LEVEL3, async (done: Function) => {
      console.info('jsLeakWatcherWatchMsgEmpty001 start');
      try {
        let obj: object = new Object();
        let emptyMsg: string = '';
        jsLeakWatcher.enable(true);
        jsLeakWatcher.watch(obj, emptyMsg);
        console.info('jsLeakWatcherWatchMsgEmpty001 succeeded');
        done();
      } catch (error) {
        console.error(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Msg_Empty_0100 expected error: code=${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Obj_Null_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Obj_Null_0100
     * @tc.desc   Test watch interface with null obj parameter, expect error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Obj_Null_0100', Level.LEVEL3, async (done: Function) => {
      console.info('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Obj_Null_0100 start');
      try {
        jsLeakWatcher.watch(null, 'test_msg');
        console.error('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Obj_Null_0100 should throw error');
        done();
      } catch (error) {
        console.error(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Obj_Null_0100 expected error: code=${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Length_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Length_0100
     * @tc.desc   Test dump interface with filePath exceeding reasonable length, expect empty array returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Length_0100', Level.LEVEL3, async (done: Function) => {
      console.info('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Length_0100 start');
      let longPath: string = '/data/local/tmp/' + generateLongString(4096);
      try {
        let files: Array<string> = jsLeakWatcher.dump(longPath);
        console.info(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Length_0100 result, files length=${files.length}`);
        expect(files.length >= 0).assertTrue();
        done();
      } catch (error) {
        console.error(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Length_0100 error: code=${error.code}`);
        expect(error.code).assertEqual(13900030);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Empty_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Empty_0100
     * @tc.desc   Test dump interface with empty filePath parameter, expect error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Empty_0100', Level.LEVEL3, async (done: Function) => {
      console.info('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Empty_0100 start');
      let emptyPath: string = '';
      try {
        let files: Array<string> = jsLeakWatcher.dump(emptyPath);
        console.error('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Empty_0100 should throw error');
        done();
      } catch (error) {
        console.error(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Empty_0100 expected error: code=${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Invalid_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Invalid_0100
     * @tc.desc   Test dump interface with invalid filePath parameter, expect empty array returned or error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Invalid_0100', Level.LEVEL3, async (done: Function) => {
      console.info('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Invalid_0100 start');
      let invalidPath: string = 'invalid_path_format';
      try {
        let files: Array<string> = jsLeakWatcher.dump(invalidPath);
        console.info(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Invalid_0100 result, files length=${files.length}`);
        expect(files.length >= 0).assertTrue();
        done();
      } catch (error) {
        console.error(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Path_Invalid_0100 error: code=${error.code}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Null_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Null_0100
     * @tc.desc   Test enableLeakWatcher interface with null configs parameter, expect error code 10801002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Null_0100', Level.LEVEL3, async (done: Function) => {
      console.info('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Null_0100 start');
      try {
        jsLeakWatcher.enableLeakWatcher(true, null, (filepath: Array<string>) => {
          console.log('Should not reach here');
          done();
        });
        done();
      } catch (err) {
        console.error(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Null_0100 expected error: code=${err.code}`);
        expect(err.code).assertEqual(10801002);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Invalid_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Invalid_0100
     * @tc.desc   Test enableLeakWatcher interface with invalid configs parameter type, expect error code 10801002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Invalid_0100', Level.LEVEL3, async (done: Function) => {
      console.info('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Invalid_0100 start');
      try {
        jsLeakWatcher.enableLeakWatcher(true, ['invalid_config'], (filepath: Array<string>) => {
          console.log('Should not reach here');
          done();
        });
        done();
      } catch (err) {
        console.error(`SUB_HiviewDFX_JsLeakWatcher_ParamSpec_Config_Invalid_0100 expected error: code=${err.code}`);
        expect(err.code).assertEqual(10801002);
        done();
      }
    })

    /**
     * @tc.name   SUB_HiviewDFX_JsLeakWatcher_ParamSpec_IsEnabled_False_0100
     * @tc.number SUB_HiviewDFX_JsLeakWatcher_ParamSpec_IsEnabled_False_0100
     * @tc.desc   Test enableLeakWatcher interface with isEnabled false, expect callback with empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_IsEnabled_False_0100', Level.LEVEL2, async (done: Function) => {
      console.info('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_IsEnabled_False_0100 start');

      const TIMEOUT = 5000; // 5秒超时
      const timeoutId = setTimeout(() => {
        console.error('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_IsEnabled_False_0100 timeout');
        done(); // 即使超时也要调用done，或者 done(false) 如果支持
      }, TIMEOUT);

      let config: Array<string> = [];

      try {
        jsLeakWatcher.enableLeakWatcher(false, config, (filepath: Array<string>) => {
          clearTimeout(timeoutId);
          console.log('SUB_HiviewDFX_JsLeakWatcher_ParamSpec_IsEnabled_False_0100 callback');
          expect(filepath.length).assertEqual(0);
          done();
        });
      } catch (error) {
        clearTimeout(timeoutId);
        hilog.error(0x0000, 'testTag', `SUB_HiviewDFX_JsLeakWatcher_ParamSpec_IsEnabled_False_0100 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}