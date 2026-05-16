import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'hiappeventAddWatcherTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function removeWatcherStrongTest() {
  describe('removeWatcherTest', (): void => {
    hilog.info(domain, tag, 'describe start');
    /**
     * @tc.name   testRemoveWatcher001
     * @tc.number testRemoveWatcher001
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters数组为空,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher001 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher1",
        appEventFilters:[]
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher001 > watcher1: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher001  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher001 end')
    })
    /**
     * @tc.name   testRemoveWatcher002
     * @tc.number testRemoveWatcher002
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters数组非空,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher002 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher2",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher002 > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher002  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher002 end')
    })
    /**
     * @tc.name   testRemoveWatcher003
     * @tc.number testRemoveWatcher003
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters数组非空,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher003 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher3",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher003 > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher003  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher003 end')
    })
    /**
     * @tc.name   testRemoveWatcher004
     * @tc.number testRemoveWatcher004
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-domain为空,返回错误值11102002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher004 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher4",
        appEventFilters: [{
          domain: '',
          names: ["test_name"]
        }],
      };
      try {
        let Holder = hiAppEvent.addWatcher(watcher);
        hilog.info(domain, tag, `testRemoveWatcher004 > watcher2: ${Holder}`)
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher004  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 11102002).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher004 end')
    })
    /**
     * @tc.name   testRemoveWatcher005
     * @tc.number testRemoveWatcher005
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-eventTypes数组为空,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher005 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher5",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          eventTypes:[],
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher005 > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher005  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher005 end')
    })
    /**
     * @tc.name   testRemoveWatcher006
     * @tc.number testRemoveWatcher006
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-eventTypes数组为hiAppEvent.EventType.STATISTIC,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher006 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher6",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          eventTypes:[hiAppEvent.EventType.STATISTIC],
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher006 > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher006  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher006 end')
    })
    /**
     * @tc.name   testRemoveWatcher007
     * @tc.number testRemoveWatcher007
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-eventTypes数组为hiAppEvent.EventType.SECURITY,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher007 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher7",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          eventTypes:[hiAppEvent.EventType.SECURITY],
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher007 > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher007  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher007 end')
    })
    /**
     * @tc.name   testRemoveWatcher008
     * @tc.number testRemoveWatcher008
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-eventTypes数组为hiAppEvent.EventType.BEHAVIOR,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher008 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher8",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          eventTypes:[hiAppEvent.EventType.BEHAVIOR],
          names: ["test_name"]
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher008 > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher008  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher008 end')
    })
    /**
     * @tc.name   testRemoveWatcher009
     * @tc.number testRemoveWatcher009
     * @tc.desc   验证调用removeWatcher,watch-appEventFilters-names数组为空数组,remove成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWatcher009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'testRemoveWatcher009 start')
      let watcher :hiAppEvent.Watcher = {
        name: "watcher9",
        appEventFilters: [{
          domain: hiAppEvent.domain.OS,
          eventTypes:[hiAppEvent.EventType.BEHAVIOR],
          names: []
        }],
      };
      let Holder = hiAppEvent.addWatcher(watcher);
      hilog.info(domain, tag, `testRemoveWatcher009 > watcher2: ${Holder}`)
      try {
        hiAppEvent.removeWatcher(watcher);
        done()
      } catch (error) {
        hilog.error(domain, tag, `testRemoveWatcher009  > error code: ${error.code}, error msg: ${error.message}`)
        expect(error.code === 401).assertTrue()
        done();
      }
      hilog.info(domain, tag, 'testRemoveWatcher009 end')
    })
  })
}