import { BusinessError } from '@kit.BasicServicesKit';
import { describe, expect, it, Level } from '@ohos/hypium'
import hichecker from '@ohos.hichecker';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default function Hichecker() {
  describe('Hichecker', () => {

    /**
     * @tc.name   HicheckernulladdRule
     * @tc.number SUB_HicheckernulladdRule
     * @tc.desc   addRule函数覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HicheckernulladdRule', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Hicheckernull  start")
        hichecker.addRule(null);
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Hicheckernullcontains
     * @tc.number SUB_Hicheckernullcontains
     * @tc.desc   contains函数覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hicheckernullcontains', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Hicheckernullcontains  start")
        hichecker.contains(null);
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   HicheckernullremoveRule
     * @tc.number SUB_HicheckernullremoveRule
     * @tc.desc   removeRule函数覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HicheckernullremoveRule', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>HicheckernullremoveRule  start")
        hichecker.removeRule(null);
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   HicheckerundefinedaddRule
     * @tc.number SUB_HicheckerundefinedaddRule
     * @tc.desc   addRule函数覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HicheckerundefinedaddRule', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Hicheckerundefined  start")
        hichecker.addRule(undefined);
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Hicheckerundefinedcontains
     * @tc.number SUB_Hicheckerundefinedcontains
     * @tc.desc   contains函数覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Hicheckerundefinedcontains', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>Hicheckerundefinedcontains  start")
        hichecker.contains(undefined);
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   HicheckerundefinedremoveRule
     * @tc.number SUB_HicheckerundefinedremoveRule
     * @tc.desc   removeRule函数覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('HicheckerundefinedremoveRule', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>HicheckernullremoveRule  start")
        hichecker.removeRule(undefined);
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Hichecker01nulladdCheckRule
     * @tc.number SUB_Hichecker01unlladdCheckRule
     * @tc.desc   addCheckRule函数覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker01nulladdCheckRule', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker01addCheckRule  start");
        hichecker.addCheckRule(null);
        console.info("====>Hichecker01addCheckRule  end");
        done();
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   Hichecker01unllremoveCheckRule
     * @tc.number SUB_Hichecker01unllremoveCheckRule
     * @tc.desc   removeCheckRule函数覆盖null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker01unllremoveCheckRule', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker01removeCheckRule  start");
        hichecker.removeCheckRule(null);
        done();
      } catch (err) {
        console.error(`Hichecker01unllremoveCheckRule code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Hichecker01getRule
     * @tc.number SUB_Hichecker01getRule
     * @tc.desc   removeCheckRule函数覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker01getRule', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker01getRule  start");
        hichecker.getRule();
        done();
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Hichecker01undefinedaddCheckRule
     * @tc.number SUB_Hichecker01undefinedaddCheckRule
     * @tc.desc   addCheckRule函数覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker01undefinedaddCheckRule', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker01addCheckRule  start");
        hichecker.addCheckRule(undefined);
        done();
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Hichecker01undefinedremoveCheckRule
     * @tc.number SUB_Hichecker01undefinedremoveCheckRule
     * @tc.desc   removeCheckRule函数覆盖undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker01undefinedremoveCheckRule', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker01undefinedremoveCheckRule  start");
        hichecker.removeCheckRule(undefined);
        done();
      } catch (err) {
        console.error(`Hichecker01undefinedremoveCheckRule code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(Number(err.code) === 401).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   Hichecker02
     * @tc.number SUB_Hichecker02
     * @tc.desc   RULE_CAUTION_TRIGGER_CRASH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker02', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker02  start")
        hichecker.addRule(hichecker.RULE_CAUTION_TRIGGER_CRASH);
        console.info("====>Hichecker02  end 01");
        done();
      }catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Hichecker03null
     * @tc.number SUB_Hichecker03null
     * @tc.desc  containsCheckRule函数覆盖 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker03null', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker03null  start")
        expect(hichecker.containsCheckRule(undefined) == false).assertTrue();
        done();
      } catch (err) {
        console.error(`code: ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }
    })

    /**
     * @tc.name   Hichecker03undefined
     * @tc.number SUB_Hichecker03undefined
     * @tc.desc  containsCheckRule函数覆盖 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Hichecker03undefined', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>Hichecker03undefined  start")
        expect(hichecker.containsCheckRule(undefined) == false).assertTrue();
        done();
      } catch (err) {
        console.error(`code:Hichecker03undefined ${(err as BusinessError).code}, message: ${(err as BusinessError).message}`);
        done();
      }
    })

  })
}