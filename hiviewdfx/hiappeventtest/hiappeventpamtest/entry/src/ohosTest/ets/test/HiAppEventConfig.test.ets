import { hiAppEvent } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

export default function HiAppEventSetConfigTest() {
  describe('HiAppEventSetConfigTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testHiAppEventSetConfig01
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0100
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype:event_rawheap值返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetConfig01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0100 start");
      try {
        let config_event_rawheap: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event_rawheap",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event_rawheap);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0100 config return_value ' + return_value);
        let result_value = Number(return_value);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0100 config result_value ' + result_value);
        expect(result_value == 0).assertTrue();
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0100 success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0100 fail!");
        expect().assertFalse();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0100 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig02
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0200
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype:event值返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventSetConfig02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0200 start");
      try {
        let config_event: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0200 config return_value ' + return_value);
        let result_value = Number(return_value);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0200 config result_value ' + result_value);
        expect(result_value == 0).assertTrue();
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0200 success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0200 fail!");
        expect().assertFalse();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0200 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig03
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0300
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype1:event_rawheap值返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0300 start");
      try {
        let config_event_rawheap: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype1": "event_rawheap",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event_rawheap);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0300 config return_value ' + return_value);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0300 fail!");
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0300 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig04
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0400
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype1:event值返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0400 start");
      try {
        let config_event: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype1": "event",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0400 config return_value ' + return_value);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0400 fail!");
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0400 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig05
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0500
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype:event_rawheap1值返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0500 start");
      try {
        let config_event_rawheap: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event_rawheap1",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event_rawheap);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0500 config return_value ' + return_value);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0500 fail!");
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0500 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig06
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0600
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype:event1值返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0600 start");
      try {
        let config_event: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event1",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0600 config return_value ' + return_value);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0600 fail!");
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0600 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig07
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0700
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入一次正确一次错误值返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0700 start");
      try {
        let config_event_rawheap: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event_rawheap",
          "js_heap_logtype1": "event1",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event_rawheap);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0700 config return_value ' + return_value);
        let result_value = Number(return_value);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0700 config result_value ' + result_value);
        expect(result_value == 0).assertTrue();
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0700 success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0700 fail!");
        expect().assertFalse();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0700 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig08
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0800
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入一次正确一次错误值返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0800 start");
      try {
        let config_event: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event",
          "js_heap_logtype1": "event1",
        };
        let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0800 config return_value ' + return_value);
        let result_value = Number(return_value);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0800 config result_value ' + result_value);
        expect(result_value == 0).assertTrue();
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0800 success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0800 fail!");
        expect().assertFalse();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0800 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig09
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_0900
     * @tc.desc   验证hiAppEvent.setEventConfig接口name参数传入undefined返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0900 start");
      try {
        let config_event_rawheap: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event_rawheap",
        };
        let return_value = await hiAppEvent.setEventConfig(undefined, config_event_rawheap);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_0900 config return_value ' + return_value);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_0900 fail!");
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_0900 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig10
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_1000
     * @tc.desc   验证hiAppEvent.setEventConfig接口name参数传入undefined返回401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_1000 start");
      try {
        let config_event: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event",
        };
        let return_value = await hiAppEvent.setEventConfig(undefined, config_event);
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_1000 config return_value ' + return_value);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_1000 fail!");
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_1000 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig11
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_1100
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype:event_rawheap值稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_1100 start");
      try {
        let config_event_rawheap: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event_rawheap",
        };
        for (let i = 1; i <= 100; i++) {
          let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event_rawheap);
          console.log('SUB_DFX_DFR_hiAppEvent_Interface_1100 config return_value ' + return_value);
          let result_value = Number(return_value);
          console.log('SUB_DFX_DFR_hiAppEvent_Interface_1100 config result_value ' + result_value);
          expect(result_value == 0).assertTrue();
          console.log('SUB_DFX_DFR_hiAppEvent_Interface_1100 ' + i + ' times success')
        };
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_1100 success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_1100 fail!");
        expect().assertFalse();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_1100 end");
    })

    /**
     * @tc.name   testHiAppEventSetConfig12
     * @tc.number SUB_DFX_DFR_hiAppEvent_Interface_1200
     * @tc.desc   验证hiAppEvent.setEventConfig接口config参数传入js_heap_logtype:event值稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHiAppEventSetConfig12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_1200 start");
      try {
        let config_event: Record<string, hiAppEvent.ParamType> = {
          "js_heap_logtype": "event",
        };
        for (let i = 1; i <= 100; i++) {
          let return_value = await hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT, config_event);
          console.log('SUB_DFX_DFR_hiAppEvent_Interface_1200 config return_value ' + return_value);
          let result_value = Number(return_value);
          console.log('SUB_DFX_DFR_hiAppEvent_Interface_1200 config result_value ' + result_value);
          expect(result_value == 0).assertTrue();
          console.log('SUB_DFX_DFR_hiAppEvent_Interface_1200 ' + i + ' times success')
        };
        console.log('SUB_DFX_DFR_hiAppEvent_Interface_1200 success');
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_hiAppEvent_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        console.info("SUB_DFX_DFR_hiAppEvent_Interface_1200 fail!");
        expect().assertFalse();
        done();
      }
      console.info("SUB_DFX_DFR_hiAppEvent_Interface_1200 end");
    })
  })
}