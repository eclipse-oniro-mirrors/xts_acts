import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, Level,expect } from '@ohos/hypium'
import hilog from '@ohos.hilog';
export default function Hilog() {
  describe('Hilog', () => {
    /**
     * @tc.name   Hilogtest1
     * @tc.number SUB_Hilogtest1
     * @tc.desc   debug函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hilogtest1', Level.LEVEL0, async (done: Function) => {
      try {
        let ret = hilog.debug(null, ' ', ' ', null);
        console.error("====>Hilogtest1 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilogtest1 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilogtest2
     * @tc.number SUB_Hilogtest2
     * @tc.desc   debug函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hilogtest2', Level.LEVEL0, async (done: Function) => {
      try {
        let ret = hilog.debug(undefined, null, null, undefined);
        console.error("====>Hilogtest2 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilogtest2 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilogtest3
     * @tc.number SUB_Hilogtest3
     * @tc.desc   debug函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hilogtest3', Level.LEVEL0, async (done: Function) => {
      try {
        let ret = hilog.debug(undefined, undefined, undefined, undefined);
        console.error("====>Hilogtest3 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilogtest3 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog01test1
     * @tc.number SUB_Hilog01test1
     * @tc.desc   info函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog01test1', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.info(null, ' ', ' ', "hello");
        console.error("====>Hilog01test1 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog01test1 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog01test2
     * @tc.number SUB_Hilog01test2
     * @tc.desc   info函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog01test2', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.info(undefined, null, null, "hello");
        console.error("====>Hilog01test2 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog01test2 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog01test3
     * @tc.number SUB_Hilog01test3
     * @tc.desc   info函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog01test3', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.info(undefined, undefined, undefined, "hello");
        console.error("====>Hilog01test3 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog01test3 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog02test1
     * @tc.number SUB_Hilog02test1
     * @tc.desc   warn函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog02test1', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.warn(null, '', '', null);
        console.error("====>Hilog02test1 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog02test1 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog02test2
     * @tc.number SUB_Hilog02test2
     * @tc.desc   warn函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog02test2', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.warn(undefined, null, null, undefined);
        console.error("====>Hilog02test2 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog02test2 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog02test3
     * @tc.number SUB_Hilog02test3
     * @tc.desc   warn函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog02test3', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.warn(undefined, undefined, undefined, undefined);
        console.error("====>Hilog02test3 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog02test3 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog03test1
     * @tc.number SUB_Hilog03test1
     * @tc.desc   error函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog03test1', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.error(null, '', '', null);
        console.error("====>Hilog03test1 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog03test1 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog03test2
     * @tc.number SUB_Hilog03test2
     * @tc.desc   error函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog03test2', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.error(undefined, null, null, undefined);
        console.error("====>Hilog03test2 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog03test2 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog03test3
     * @tc.number SUB_Hilog03test3
     * @tc.desc   error函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog03test3', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.error(undefined, undefined, undefined, undefined);
        console.error("====>Hilog03test3 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog03test3 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog04test1
     * @tc.number SUB_Hilog04test1
     * @tc.desc   fatal函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog04test1', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.fatal(null, '', '', null);
        console.error("====>Hilog04test1 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog04test1 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog04test2
     * @tc.number SUB_Hilog04test2
     * @tc.desc   fatal函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog04test2', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.fatal(undefined, null, null, undefined);
        console.error("====>Hilog04test2 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog04test2 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog04test3
     * @tc.number SUB_Hilog04test3
     * @tc.desc   fatal函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog04test3', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.fatal(undefined, undefined, undefined, undefined);
        console.error("====>Hilog04test3 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog04test3 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog05test1
     * @tc.number SUB_Hilog05test1
     * @tc.desc   isLoggable函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog05test1', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.isLoggable(null, '', null);
        console.error("====>Hilog05test1 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog05test1 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog05test2
     * @tc.number SUB_Hilog05test2
     * @tc.desc   isLoggable函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog05test2', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.isLoggable(undefined, null, null);
        console.error("====>Hilog05test2 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog05test2 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog05test3
     * @tc.number SUB_Hilog05test3
     * @tc.desc   isLoggable函数异常值覆盖null/‘’/undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog05test3', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.isLoggable(undefined, undefined, null);
        console.error("====>Hilog05test3 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog05test3 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog06
     * @tc.number SUB_Hilog06
     * @tc.desc   setMinLogLevel函数覆盖枚举‘DEBUG’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog06', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.setMinLogLevel(hilog.LogLevel.DEBUG);
        console.error("====>Hilog06 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog06 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog07test1
     * @tc.number SUB_Hilog07test1
     * @tc.desc   setLogLevel函数覆盖枚举‘DEBUG’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog07test1', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.setLogLevel(hilog.LogLevel.DEBUG, hilog.PreferStrategy.PREFER_OPEN_LOG);
        console.error("====>Hilog07test1 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog07test1 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog07test2
     * @tc.number SUB_Hilog07test2
     * @tc.desc   setLogLevel函数覆盖枚举‘INFO’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog07test2', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.setLogLevel(hilog.LogLevel.INFO, hilog.PreferStrategy.PREFER_OPEN_LOG);
        console.error("====>Hilog07test2 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog07test2 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   Hilog07test3
     * @tc.number SUB_Hilog07test3
     * @tc.desc   setLogLevel函数覆盖枚举‘FATAL’
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hilog07test3', Level.LEVEL2, async (done: Function) => {
      try {
        let ret = hilog.setLogLevel(hilog.LogLevel.FATAL, hilog.PreferStrategy.PREFER_OPEN_LOG);
        console.error("====>Hilog07test3 - Test first null parameter err: " + ret);
        done();
      } catch (error) {
        console.error("====>Hilog07test3 - Test first null parameter caught error: " + error);
        expect(error === 401).assertTrue();
        done();
      }
    })



  })
}