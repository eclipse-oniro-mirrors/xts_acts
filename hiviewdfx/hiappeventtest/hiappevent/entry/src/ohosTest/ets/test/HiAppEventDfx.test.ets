import { hiAppEvent, hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level } from '@ohos/hypium'
import hiAppEventdfx from '@ohos.hiviewdfx.hiAppEvent';
import { ErrorCode } from '@ohos.ability.errorCode';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HiAppEventDFX'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function HiAppEvent1() {
  describe('HiAppEventdfx', () => {
    /**
     * @tc.name   hiAppEventdfx_addWatcher_appEventFilters_null_1
     * @tc.number hiAppEventdfx_addWatcher_appEventFilters_null_1
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters数组为空,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hiAppEventdfx_addWatcher_appEventFilters_null_1', Level.LEVEL3, async (done: Function) => {
      console.info('hiAppEventdfx_addWatcher_appEventFilters_null_1 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher1",
        appEventFilters:[]
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      console.info(`hiAppEventdfx_addWatcher_appEventFilters_null_1 > watcher1: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        console.error(`hiAppEventdfx_addWatcher_appEventFilters_null_1  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      console.info('hiAppEventdfx_addWatcher_appEventFilters_null_1 end');
    });
    /**
     * @tc.name   hiAppEventdfx_addWatcher_appEventFilters_eventTypes_null
     * @tc.number hiAppEventdfx_addWatcher_appEventFilters_eventTypes_null
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-eventTypes数组为空,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hiAppEventdfx_addWatcher_appEventFilters_eventTypes_null', Level.LEVEL0, async (done: Function) =>  {
      console.info('hiAppEventdfx_addWatcher_appEventFilters_eventTypes_null start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher5",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          eventTypes:[],
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      console.info(`hiAppEventdfx_addWatcher_appEventFilters_eventTypes_null > watcher5: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        console.error(`hiAppEventdfx_addWatcher_appEventFilters_eventTypes_null  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      console.info('hiAppEventdfx_addWatcher_appEventFilters_eventTypes_null end')
    });
    /**
     * @tc.name   hiAppEventdfx_addWatcher_appEventFilters_name_null
     * @tc.number hiAppEventdfx_addWatcher_appEventFilters_name_null
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-name数组为空,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hiAppEventdfx_addWatcher_appEventFilters_name_null', Level.LEVEL0, async (done: Function) =>  {
      console.info('hiAppEventdfx_addWatcher_appEventFilters_name_null start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher555",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          names: []
        }],
      };
      try {
        let Holder = hiAppEvent.addWatcher(watcher);
        console.info(`hiAppEventdfx_addWatcher_appEventFilters_name_null > watcher555: ${Holder}`)
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        console.error(`hiAppEventdfx_addWatcher_appEventFilters_name_null  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      console.info('hiAppEventdfx_addWatcher_appEventFilters_name_null end')
    });
    /**
     * @tc.name   hiAppEventdfx_addWatcher_appEventFilters_eventTypes_SECURITY
     * @tc.number hiAppEventdfx_addWatcher_appEventFilters_eventTypes_SECURITY
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-eventTypes数组为SECURITY,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hiAppEventdfx_addWatcher_appEventFilters_eventTypes_SECURITY', Level.LEVEL0, async (done: Function) =>  {
      console.info('hiAppEventdfx_addWatcher_appEventFilters_eventTypes_SECURITY start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher5",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          eventTypes:[hiAppEvent.EventType.SECURITY],
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      console.info(`hiAppEventdfx_addWatcher_appEventFilters_eventTypes_SECURITY > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        console.error(`hiAppEventdfx_addWatcher_appEventFilters_eventTypes_SECURITY  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      console.info('hiAppEventdfx_addWatcher_appEventFilters_eventTypes_SECURITY end')
    });
    /**
     * @tc.name   hiAppEventdfx_write_eventType_SECURITY
     * @tc.number hiAppEventdfx_write_eventType_SECURITY
     * @tc.desc   验证调用write,ventType枚举值是SECURITY、BEHAVIOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hiAppEventdfx_write_eventType_SECURITY', Level.LEVEL1, async (done: Function) =>  {
      console.info('hiAppEventdfx_write_eventType_SECURITY start')
      let eventParams: Record<string, number> = {'clickTime': 100};
      let eventInfo: hiAppEvent.AppEventInfo = {
        // Define the event domain.
        domain: 'button',
        // Define the event name.
        name: 'click',
        // Define the event type.
        eventType: hiAppEvent.EventType.SECURITY,
        // Define the event parameters.
        params: eventParams,
      };
      hiAppEvent.write(eventInfo).then(() => {
        console.info('hiAppEventDfx', `success to write event`);
        done();
      }).catch((err: BusinessError) => {
        console.error('hiAppEventDfx', `code: ${err.code}, message: ${err.message}`);
        expect(err.code === 401).assertTrue();
        done();
      });
      console.info('hiAppEventdfx_write_eventType_SECURITY end')
    });
    /**
     * @tc.name   testHiAppEvent016
     * @tc.number testHiAppEvent016
     * @tc.desc   验证clearData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHiAppEvent016', Level.LEVEL3, async (done: Function) => {
      console.info('testHiAppEvent016 start')
      try {
        hiAppEvent.clearData()
        done();
      } catch (err) {
        console.error(`testHiAppEvent016 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code === 401).assertTrue()
        done();
      }
      console.info('testHiAppEvent016 end')
    });
    /**
     * @tc.name   testHiAppEventconfigEventPolicy020
     * @tc.number testHiAppEventconfigEventPolicy020
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank-MainThreadJank-autoStopSampling为false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEventconfigEventPolicy020', Level.LEVEL0, async (done: Function) =>  {
      console.info( `testHiAppEventconfigEventPolicy020 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy": {
          "logType": 1,
          "sampleInterval": 100,
          "ignoreStartupTime": 11,
          "sampleCount": 21,
          "reportTimesPerApp": 3,
          "autoStopSampling": false
        }
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        console.info( `testHiAppEventconfigEventPolicy020 configEventPolicy call successful`);
        done();
      }).catch((err: Error) => {
        console.error( 'testHiAppEventconfigEventPolicy020 message :(%{public}s', err.message);
        expect(false).assertTrue();
        done();
      });
      console.info( `testHiAppEventconfigEventPolicy020 end`);
    })
    /**
     * @tc.name   testHiAppEventconfigEventPolicy021
     * @tc.number testHiAppEventconfigEventPolicy021
     * @tc.desc   验证hiAppEvent.configEventPolicy接口测试-MainThreadJank为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiAppEventconfigEventPolicy021',  Level.LEVEL1, async (done: Function) =>  {
      console.info( `testHiAppEventconfigEventPolicy021 start`);
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy": undefined
      };
      hiAppEvent.configEventPolicy(policy).then(() => {
        console.error( `Unexpected success for undefined policy`);
        done();
      }).catch((err: Error) => {
        console.error( 'testHiAppEventconfigEventPolicy001 Code: ${err?.code}, message: ${err?.message}');
        expect(false).assertTrue;
        done();
      });
      console.info( `testHiAppEventconfigEventPolicy021 end`);
    })
    /**
     * @tc.name   hiAppEventdfx_addWatcher_null_1
     * @tc.number SUB_hiAppEventdfx_addWatcher_null_1
     * @tc.desc   addWatcher函数异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx_addWatcher_null_1', Level.LEVEL0, async (done: Function) => {
      let watcher: hiAppEvent.Watcher = {
        name: " ",
      }
      try{
        console.info("====>hiAppEventdfx1 error start");
        hiAppEvent.addWatcher(null);
        console.info("====>hiAppEventdfx1 error end 02");
        done();
      }catch (err) {
        console.info(`hiAppEventdfx_addWatcher_null_1 > error code: ${err.code}, error msg: ${err.message}`);
        // hilog.error(0x0000, 'hiAppEventdfx1', `failed to write event, code: ${err.code}, message: ${err.message}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx_removeWatcher_null_1
     * @tc.number SUB_hiAppEventdfx_removeWatcher_null_1
     * @tc.desc   removeWatcher函数异常值覆盖，null
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx_removeWatcher_null_1', Level.LEVEL0, async (done: Function) => {
      let watcher: hiAppEvent.Watcher = {
        name: " ",
      }
      try{
        console.info("====>hiAppEventdfx1 error end 02");
        hiAppEvent.removeWatcher(null);
        console.info("====>hiAppEventdfx1 error end 03");
        done();
      }catch (err) {
        hilog.error(0x0000, 'hiAppEventdfx1', `failed to write event, code: ${err.code}, message: ${err.message}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx_addWatcher_undefined_1
     * @tc.number SUB_hiAppEventdfx_addWatcher_undefined_1
     * @tc.desc   addWatcher函数异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx_addWatcher_undefined_1', Level.LEVEL0, async (done: Function) => {
      let watcher: hiAppEvent.Watcher = {
        name: " ",
      }
      try{
        console.info("====>hiAppEventdfx1 error start");
        hiAppEvent.addWatcher(undefined);
        console.info("====>hiAppEventdfx1 error end 04");
        done();
      }catch (err) {
        hilog.error(0x0000, 'hiAppEventdfx1', `failed to write event, code: ${err.code}, message: ${err.message}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx_removeWatcher_undefined_1
     * @tc.number SUB_hiAppEventdfx_removeWatcher_undefined_1
     * @tc.desc   removeWatcher函数异常值覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx_removeWatcher_undefined_1', Level.LEVEL0, async (done: Function) => {
      let watcher: hiAppEvent.Watcher = {
        name: " ",
      }
      try{
        console.info("====>hiAppEventdfx1 error start");
        hiAppEvent.removeWatcher(undefined);
        console.info("====>hiAppEventdfx1 error end 02");
        done();
      }catch (err) {
        hilog.error(0x0000, 'hiAppEventdfx1', `failed to write event, code: ${err.code}, message: ${err.message}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx2
     * @tc.number SUB_hiAppEventdfx2
     * @tc.desc   clearData函数异常值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('hiAppEventdfx2', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hiAppEvent.clearData();
        console.info("====>hiAppEventdfx2 err: " + ret)
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEventdfx2', `failed to setUserId event, code=${err.code}`);
        expect(err.code === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx3
     * @tc.number SUB_hiAppEventdfx3
     * @tc.desc   setUserId函数的异常值覆盖，' '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx3', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx3 error start");
        hiAppEvent.setUserId(' ', ' ');
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEventdfx3', `failed to setUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx3_null
     * @tc.number hiAppEventdfx3_null
     * @tc.desc   setUserId函数的异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx3_null', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>iAppEventdfx3_null error start");
        hiAppEvent.setUserId(null, null);
        done();
      } catch (err) {
        hilog.error(0x0000, 'iAppEventdfx3_null', `failed to setUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx3_undefined
     * @tc.number SUB_hiAppEventdfx3_undefined
     * @tc.desc   setUserId函数的异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx3_undefined', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx3_undefined error start");
        hiAppEvent.setUserId(undefined, undefined);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEventdfx3_undefined', `failed to setUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx4
     * @tc.number SUB_hiAppEventdfx4
     * @tc.desc   getUserId函数的异常值覆盖，' '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx4', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserId('key', 'value');
      try {
        console.info("====>hiAppEventdfx4 error start");
        let value: string = hiAppEvent.getUserId(' ');
        console.info("====>hiAppEventdfx4 error end 01");
        hilog.info(0x0000, 'hiAppEvent', `getUserId event was successful, userId=${value}`);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx4_null
     * @tc.number SUB_hiAppEventdfx4_null
     * @tc.desc   getUserId函数的异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx4_null', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserId('key', 'value');
      try {
        console.info("====>hiAppEventdfx4_null error start");
        let value: string = hiAppEvent.getUserId(null);
        console.info("====>hiAppEventdfx4_null error end 01");
        hilog.info(0x0000, 'hiAppEvent', `getUserId event was successful, userId=${value}`);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx4_undefined
     * @tc.number SUB_hiAppEventdfx4_undefined
     * @tc.desc   getUserId函数的异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx4_undefined', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserId('key', 'value');
      try {
        console.info("====>hiAppEventdfx4_undefined error start");
        let value: string = hiAppEvent.getUserId(undefined);
        console.info("====>hiAppEventdfx4_undefined error end 01");
        hilog.info(0x0000, 'hiAppEvent', `getUserId event was successful, userId=${value}`);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx5
     * @tc.number SUB_hiAppEventdfx5
     * @tc.desc   setUserProperty函数的异常值覆盖，' '/null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx5', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx5 error start");
        hiAppEvent.setUserProperty(' ', ' ');
        console.info("====>hiAppEventdfx5 error end 02");
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to setUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx5_null
     * @tc.number SUB_hiAppEventdfx5_null
     * @tc.desc   setUserProperty函数的异常值覆盖，' '/null/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx5_null', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx5_null error start");
        hiAppEvent.setUserProperty(null, null);
        console.info("====>hiAppEventdfx5_null error end 02");
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to setUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx5_undefined
     * @tc.number SUB_hiAppEventdfx5_undefined
     * @tc.desc   setUserProperty函数的异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx5_undefined', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx5_undefined error start");
        hiAppEvent.setUserProperty(undefined, undefined);
        console.info("====>hiAppEventdfx5_undefined error end 02");
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to setUserId event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx6
     * @tc.number SUB_hiAppEventdfx6
     * @tc.desc   getUserProperty函数的异常值覆盖，' '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx6', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserProperty('key', 'value');
      try {
        console.info("====>hiAppEventdfx6 error start");
        let value: string = hiAppEvent.getUserProperty(' ');
        console.info("====>hiAppEventdfx6 error end 01");
        hilog.info(0x0000, 'hiAppEvent', `getUserProperty event was successful, userProperty=${value}`);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserProperty event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx6_null
     * @tc.number SUB_hiAppEventdfx6_null
     * @tc.desc   getUserProperty函数的异常值覆盖，null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx6_null', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserProperty('key', 'value');
      try {
        console.info("====>hiAppEventdfx6 error start");
        let value: string = hiAppEvent.getUserProperty(null);
        console.info("====>hiAppEventdfx6 error end 01");
        hilog.info(0x0000, 'hiAppEvent', `getUserProperty event was successful, userProperty=${value}`);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserProperty event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx6_undefined
     * @tc.number SUB_hiAppEventdfx6_undefined
     * @tc.desc   getUserProperty函数的异常值覆盖，undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx6_undefined', Level.LEVEL2, async (done: Function) => {
      hiAppEvent.setUserProperty('key', 'value');
      try {
        console.info("====>hiAppEventdfx6_undefined error start");
        let value: string = hiAppEvent.getUserProperty(undefined);
        console.info("====>hiAppEventdfx6_undefined error end 01");
        hilog.info(0x0000, 'hiAppEvent', `getUserProperty event was successful, userProperty=${value}`);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to getUserProperty event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx7_add_null
     * @tc.number SUB_hiAppEventdfx7_add_null
     * @tc.desc   addProcessor函数的异常值覆盖,unll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx7_add_null', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx7_add_null error start");
        let id: number = hiAppEvent.addProcessor(null);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to removeProcessor event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx7_add_undefined
     * @tc.number SUB_hiAppEventdfx7_add_undefined
     * @tc.desc   addProcessor函数的异常值覆盖,undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx7_add_undefined', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx7_add_undefined error start");
        let id1: number = hiAppEvent.addProcessor(undefined);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to removeProcessor event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx7_rme_null
     * @tc.number SUB_hiAppEventdfx7_rme_null
     * @tc.desc   removeProcessor函数的异常值覆盖,unll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx7_rme_null', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx7_rme_null error start");
        hiAppEvent.removeProcessor(null);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to removeProcessor event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx7_rme_undefined
     * @tc.number SUB_hiAppEventdfx7_rme_undefined
     * @tc.desc   removeProcessor函数的异常值覆盖,undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx7_rme_undefined', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>hiAppEventdfx7_rme_undefined error start");
        hiAppEvent.removeProcessor(undefined);
        done();
      } catch (err) {
        hilog.error(0x0000, 'hiAppEvent', `failed to removeProcessor event, code=${err.code}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx8
     * @tc.number SUB_hiAppEventdfx8
     * @tc.desc   addProcessorFromConfig函数的异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx8', Level.LEVEL2, async (done: Function) => {
      try {
      hiAppEvent.addProcessorFromConfig(null).then((processorId) => {
        hilog.info(0x0000, 'hiAppEvent', `Succeeded in adding processor from config, processorId=${processorId}`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to add processor from config, code: ${err.code}, message: ${err.message}`);
        done();
      });
      }catch (err) {
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   SUB_hiAppEventdfx8_test1
     * @tc.number SUB_hiAppEventdfx8-test1
     * @tc.desc   addProcessorFromConfig函数的异常值覆盖,undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_hiAppEventdfx8_test1', Level.LEVEL2, async (done: Function) => {
      try {
        hiAppEvent.addProcessorFromConfig(undefined).then((processorId) => {
          hilog.info(0x0000, 'hiAppEvent', `Succeeded in adding processor from config, processorId=${processorId}`);
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hiAppEvent', `Failed to add processor from config, code: ${err.code}, message: ${err.message}`);
          done();
        });
      }catch (err) {
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx9
     * @tc.number SUB_hiAppEventdfx9
     * @tc.desc   configEventPolicy函数的异常值覆盖 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx9', Level.LEVEL2, async (done:Function) => {
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{
          "logType": 1,
          "sampleInterval": 100,
          "ignoreStartupTime": 11,
          "sampleCount": 21,
          "reportTimesPerApp": 3,
          "autoStopSampling": true
        }
      };
      hiAppEvent.configEventPolicy(null).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set main thread jank event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set main thread jank event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      });
    })

    /**
     * @tc.name   hiAppEventdfx9_test1
     * @tc.number SUB_hiAppEventdfx9-test1
     * @tc.desc   configEventPolicy函数的异常值覆盖 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx9_test1', Level.LEVEL2, async (done:Function) => {
      let policy: hiAppEvent.EventPolicy = {
        "mainThreadJankPolicy":{
          "logType": 1,
          "sampleInterval": 100,
          "ignoreStartupTime": 11,
          "sampleCount": 21,
          "reportTimesPerApp": 3,
          "autoStopSampling": true
        }
      };
      hiAppEvent.configEventPolicy(undefined).then(() => {
        hilog.info(0x0000, 'hiAppEvent', `Successfully set main thread jank event policy.`);
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'hiAppEvent', `Failed to set main thread jank event policy. Code: ${err?.code}, message: ${err?.message}`);
        expect(Number(err.code) === 401).assertTrue()
        done();
      });
    })

    /**
     * @tc.name   hiAppEventdfx10_size_null
     * @tc.number SUB_hiAppEventdfx10_size_null
     * @tc.desc   setsize函数的异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx10_size_null', Level.LEVEL2, async (done:Function) => {
      console.info('hiAppEventdfx10_size_null start')
      let holder2: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      try {
        holder2.setSize(null);
        console.info("====> hiAppEventdfx10_size_null write undefined end 01");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx10_size_null setId write catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code)  === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx10_size_undefined
     * @tc.number SUB_hiAppEventdfx10_size_undefined
     * @tc.desc   setsize函数的异常值覆盖,undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx10_size_undefined', Level.LEVEL2, async (done:Function) => {
      console.info('hiAppEventdfx10_size_undefined start')
      let holder2: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      try {
        holder2.setSize(undefined);
        console.info("====> hiAppEventdfx10_size_undefined write undefined end 01");
        done();

      }catch(err){
        console.error(`====>hiAppEventdfx10_size_undefined setId write catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code)  === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx10_row_null
     * @tc.number SUB_hiAppEventdfx10_row_null
     * @tc.desc   setRow函数的异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx10_row_null', Level.LEVEL2, async (done:Function) => {
      console.info('hiAppEventdfx10_row_null start')
      let holder2: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      try {
        holder2. setRow(null);
        console.info("====> hiAppEventdfx10_row_null write undefined end 01");
        done();

      }catch(err){
        console.error(`====>hiAppEventdfx10_row_null setId write catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code)  === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx10_row_undefined
     * @tc.number SUB_hiAppEventdfx10_row_undefined
     * @tc.desc   setRow函数的异常值覆盖,undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx10_row_undefined', Level.LEVEL2, async (done:Function) => {
      console.info('hiAppEventdfx10_row_undefined start')
      let holder2: hiAppEvent.AppEventPackageHolder = new hiAppEvent.AppEventPackageHolder("Watcher1");
      try {
        holder2. setRow(undefined);
        console.info("====> hiAppEventdfx10_row_undefined write undefined end 01");
        done();

      }catch(err){
        console.error(`====>hiAppEventdfx10_row_undefined setId write catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code)  === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   hiAppEventdfx11_null
     * @tc.number hiAppEventdfx11_null
     * @tc.desc   configure函数的异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hiAppEventdfx11_null', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx11_null start");
      try{
        hiAppEvent.configure(null);
        console.info("====> hiAppEventdfx11_null configure null ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx11_null configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code)  === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx11_null end");
    })

    /**
     * @tc.name   HiAppEventTest_undefined
     * @tc.number HiAppEventTest_undefined
     * @tc.desc   configure函数的异常值覆盖,undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HiAppEventTest_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("HiAppEventTest_undefined start");
      try{
        hiAppEvent.configure(undefined);
        console.info("====> HiAppEventTest_undefined configure undefined ");
        done();
      }catch(err){
        console.error(`====>HiAppEventTest_undefined configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code)  === 401).assertTrue()
        done();
      }
      console.info("HiAppEventTest_undefined end");
    })

    /**
     * @tc.name   hiAppEventdfx12test
     * @tc.number hiAppEventdfx12test
     * @tc.desc   write函数的异常值覆盖枚举STATISTIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx12test', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx12test start");
      try{
        let eventParams: Record<string, number> = {'clickTime': 100};
        let eventInfo: hiAppEvent.AppEventInfo = {
          // Define the event domain.
          domain: 'button',
          // Define the event name.
          name: 'click',
          // Define the event type.
          eventType: hiAppEvent.EventType.STATISTIC,
          // Define the event parameters.
          params: eventParams,
        };
        hiAppEvent.write(eventInfo);
        console.info("====> hiAppEventdfx12test write STATISTIC ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx12test configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx12test end");
    })

    /**
     * @tc.name   hiAppEventdfx12test1
     * @tc.number hiAppEventdfx12test1
     * @tc.desc   write函数的异常值覆盖枚举SECURITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx12test1', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx12test1 start");
      try{
        let eventParams: Record<string, number> = {'clickTime': 100};
        let eventInfo: hiAppEvent.AppEventInfo = {
          // Define the event domain.
          domain: 'button',
          // Define the event name.
          name: 'click',
          // Define the event type.
          eventType: hiAppEvent.EventType.STATISTIC,
          // Define the event parameters.
          params: eventParams,
        };
        eventInfo.eventType = hiAppEvent.EventType.SECURITY;
        hiAppEvent.write(eventInfo);
        console.info("====> hiAppEventdfx12test1 write SECURITY ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx12test1 configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx12test1 end");
    })

    /**
     * @tc.name   hiAppEventdfx12test2
     * @tc.number hiAppEventdfx12test2
     * @tc.desc   write函数的异常值覆盖枚举BEHAVIOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx12test2', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx12test2 start");
      try{
        let eventParams: Record<string, number> = {'clickTime': 100};
        let eventInfo: hiAppEvent.AppEventInfo = {
          // Define the event domain.
          domain: 'button',
          // Define the event name.
          name: 'click',
          // Define the event type.
          eventType: hiAppEvent.EventType.STATISTIC,
          // Define the event parameters.
          params: eventParams,
        };
        eventInfo.eventType = hiAppEvent.EventType.BEHAVIOR;
        hiAppEvent.write(eventInfo);
        console.info("====> hiAppEventdfx12test2 write BEHAVIOR ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx12test2 configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx12test2 end");
    })

    /**
     * @tc.name   hiAppEventdfx12_null
     * @tc.number hiAppEventdfx12_null
     * @tc.desc   write函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx12_null', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx12_null start");
      try{
        let eventParams: Record<string, number> = {'clickTime': 100};
        let eventInfo: hiAppEvent.AppEventInfo = {
          // Define the event domain.
          domain: 'button',
          // Define the event name.
          name: 'click',
          // Define the event type.
          eventType: hiAppEvent.EventType.STATISTIC,
          // Define the event parameters.
          params: eventParams,
        };
        hiAppEvent.write(null);
        console.info("====> hiAppEventdfx12_null write null ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx12_null configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx12_null end");
    })

    /**
     * @tc.name   hiAppEventdfx12_undefined
     * @tc.number hiAppEventdfx12_undefined
     * @tc.desc   write函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx12_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx12_undefined start");
      try{
        let eventParams: Record<string, number> = {'clickTime': 100};
        let eventInfo: hiAppEvent.AppEventInfo = {
          // Define the event domain.
          domain: 'button',
          // Define the event name.
          name: 'click',
          // Define the event type.
          eventType: hiAppEvent.EventType.STATISTIC,
          // Define the event parameters.
          params: eventParams,
        };
        hiAppEvent.write(undefined);
        console.info("====> hiAppEventdfx12_undefined write undefined ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx12_undefined configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx12_undefined end");
    })

    /**
     * @tc.name   hiAppEventdfx13_unll
     * @tc.number hiAppEventdfx13_unll
     * @tc.desc   write函数的异常值覆盖,第一个参数异常值null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx13_unll', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx13_unll start");
      try{
        hiAppEvent.write(null, null);
        console.info("====> hiAppEventdfx13_unll write null ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx13_unll configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx13_unll end");
    })

    /**
     * @tc.name   hiAppEventdfx13_undefined
     * @tc.number hiAppEventdfx13_undefined
     * @tc.desc   write函数的异常值覆盖,第一个参数异常值undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx13_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx13_undefined start");
      try{
        hiAppEvent.write(undefined, undefined);
        console.info("====> hiAppEventdfx13_undefined write undefined ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx13_undefined configure catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx13_undefined end");
    })

    /**
     * @tc.name   hiAppEventdfx14_null
     * @tc.number hiAppEventdfx14_null
     * @tc.desc   setEventParam函数的异常值覆盖,第一个参数异常值null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx14_null', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx14_null start");
      try{
        hiAppEvent.setEventParam(null, "test_domain", "test_name");
        console.info("====> hiAppEventdfx14_null setEventParam null ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx14_null setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx14_null end");
    })

    /**
     * @tc.name   hiAppEventdfx14_undefined
     * @tc.number hiAppEventdfx14_undefined
     * @tc.desc   setEventParam函数的异常值覆盖,第一个参数异常值undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx14_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx14_undefined start");
      try{
        hiAppEvent.setEventParam(undefined, "test_domain", "test_name");
        console.info("====> hiAppEventdfx14_undefined setEventParam undefined ");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx14_undefined setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx14_undefined end");
    })

    /**
     * @tc.name   hiAppEventdfx15
     * @tc.number hiAppEventdfx15
     * @tc.desc   setEventParam函数的异常值覆盖,第2个参数异常值空值""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx15', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx15 start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "", "test_name");
        console.info("====> hiAppEventdfx15 setEventParam empty");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx15 setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx15 end");
    })

    /**
     * @tc.name   hiAppEventdfx15_null
     * @tc.number hiAppEventdfx15_null
     * @tc.desc   setEventParam函数的异常值覆盖,第2个参数异常值null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx15_null', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx15_null start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, null, "test_name");
        console.info("====> hiAppEventdfx15_null setEventParam null");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx15_null setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx15_null end");
    })

    /**
     * @tc.name   hiAppEventdfx15_undefined
     * @tc.number hiAppEventdfx15_undefined
     * @tc.desc   setEventParam函数的异常值覆盖,第2个参数异常值undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx15_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx15_undefined start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, undefined, "test_name");
        console.info("====> hiAppEventdfx15_undefined setEventParam undefined");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx15_undefined setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx15_undefined end");
    })

    /**
     * @tc.name   hiAppEventdfx16
     * @tc.number hiAppEventdfx16
     * @tc.desc   setEventParam函数的异常值覆盖,第3个参数异常值空值""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx16', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx16 start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", "");
        console.info("====> hiAppEventdfx16 setEventParam empty");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx16 setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx16 end");
    })

    /**
     * @tc.name   hiAppEventdfx16_null
     * @tc.number hiAppEventdfx16_null
     * @tc.desc   setEventParam函数的异常值覆盖,第3个参数异常值null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx16_null', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx16_null start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", null);
        console.info("====> hiAppEventdfx16_null setEventParam null");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx16_null setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx16_null end");
    })

    /**
     * @tc.name   hiAppEventdfx16_undefined
     * @tc.number hiAppEventdfx16_undefined
     * @tc.desc   setEventParam函数的异常值覆盖,第3个参数异常值undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx16_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx16_undefined start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventParam(eventParams, "test_domain", undefined);
        console.info("====> hiAppEventdfx16_undefined setEventParam undefined");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx16_undefined setEventParam catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx16_undefined end");
    })

    /**
     * @tc.name   hiAppEventdfx17
     * @tc.number hiAppEventdfx17
     * @tc.desc   setEventConfig函数的异常值覆盖,第1个参数异常值空值""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx17', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx17 start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventConfig("",eventParams);
        console.info("====> hiAppEventdfx17 setEventConfig empty");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx17 setEventConfig catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx17 end");
    })

    /**
     * @tc.name   hiAppEventdfx17_null
     * @tc.number hiAppEventdfx17_null
     * @tc.desc   setEventConfig函数的异常值覆盖,第1个参数异常值空值null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx17_null', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx17_null start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventConfig(null,eventParams);
        console.info("====> hiAppEventdfx17_null setEventConfig null");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx17_null setEventConfig catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx17_null end");
    })

    /**
     * @tc.name   hiAppEventdfx17_undefined
     * @tc.number hiAppEventdfx17_undefined
     * @tc.desc   setEventConfig函数的异常值覆盖,第1个参数异常值空值undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx17_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx17_undefined start");
      try{
        let eventParams: Record<string, hiAppEvent.ParamType> = {
          "123test_param": true,
        };
        hiAppEvent.setEventConfig(undefined,eventParams);
        console.info("====> hiAppEventdfx17_undefined setEventConfig undefined");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx17_undefined setEventConfig catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx17_undefined end");
    })

    /**
     * @tc.name   hiAppEventdfx18_null
     * @tc.number hiAppEventdfx18_null
     * @tc.desc   setEventConfig函数的异常值覆盖,第2个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx18_null', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx18_null start");
      try{
        hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT,null);
        console.info("====> hiAppEventdfx18_null setEventConfig null");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx18_null setEventConfig catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx18_null end");
    })

    /**
     * @tc.name   hiAppEventdfx18_undefined
     * @tc.number hiAppEventdfx18_undefined
     * @tc.desc   setEventConfig函数的异常值覆盖,第2个参数异常值undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hiAppEventdfx18_undefined', Level.LEVEL2, async (done:Function) => {
      console.info("hiAppEventdfx18_undefined start");
      try{
        hiAppEvent.setEventConfig(hiAppEvent.event.RESOURCE_OVERLIMIT,undefined);
        console.info("====> hiAppEventdfx18_undefined setEventConfig undefined");
        done();
      }catch(err){
        console.error(`====>hiAppEventdfx18_undefined setEventConfig catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(Number(err.code) === 401).assertTrue()
        done();
      }
      console.info("hiAppEventdfx18_undefined end");
    })
    /**
     * @tc.name   testHiAppEvent027
     * @tc.number testHiAppEvent027
     * @tc.desc   addProcessor函数的异常值覆盖,第debugMode参数异常值true覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEvent027', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent010 start');
      let config: Record<string, string> = {
        "": "",
      };
      let processor: hiAppEvent.Processor = {
        name: 'test_processor',
        debugMode: true,
        routeInfo: '',
        appId: '',
        onStartReport: false,
        onBackgroundReport: false,
        periodReport: -1,
        batchReport: -2,
        userIds: [],
        userProperties: [],
        configId: -1,
        customConfigs: config,
        eventConfigs: [
          {
            domain: '',
            name: 'testEvent',
            isRealTime: true
          }
        ],
        configName:  'SDK_OCG'
      }
      try {
        let processorId = hiAppEvent.addProcessor(processor);
        hilog.info(domain, tag, `testHiAppEvent027 > processorId: ${processorId}`)
        hiAppEvent.removeProcessor(processorId)
        done()
      }
      catch (err) {

        hilog.error(domain, tag, `testHiAppEvent027 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });
    /**
     * @tc.name   testHiAppEvent028
     * @tc.number testHiAppEvent028
     * @tc.desc   addProcessor函数的异常值覆盖,第debugMode参数异常值true覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHiAppEvent028', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testHiAppEvent010 start');
      let config: Record<string, string> = {
        "": "",
      };
      let processor: hiAppEvent.Processor = {
        name: 'test_processor',
        debugMode: true,
        routeInfo: '',
        appId: '',
        onStartReport: false,
        onBackgroundReport: false,
        periodReport: -1,
        batchReport: -2,
        userIds: [],
        userProperties: [],
        configId: -1,
        customConfigs: config,
        eventConfigs: [],
        configName:  'SDK_OCG'
      }
      try {
        let processorId = hiAppEvent.addProcessor(processor);
        hilog.info(domain, tag, `testHiAppEvent028 > processorId: ${processorId}`)
        hiAppEvent.removeProcessor(processorId)
        done()
      }
      catch (err) {

        hilog.error(domain, tag, `testHiAppEvent028 > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue()
        done();
      }
    });
  })
}
