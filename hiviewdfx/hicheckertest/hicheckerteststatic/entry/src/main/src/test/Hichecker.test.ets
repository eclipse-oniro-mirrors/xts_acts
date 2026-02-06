/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hichecker from '@ohos.hichecker'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HiCheckerTest '; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function hicheckerTest() {
  beforeAll(():void => {
    hilog.info(domain, tag, 'HiCheckerTest beforeAll called');
  })

  afterAll(():void => {
    hilog.info(domain, tag, 'HiCheckerTest afterAll called');
    hichecker.removeCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
    hichecker.removeCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK);
    hichecker.removeCheckRule(hichecker.RULE_CAUTION_PRINT_LOG);
    hichecker.removeCheckRule(hichecker.RULE_CAUTION_TRIGGER_CRASH);
  })

  beforeEach(():void => {
    hilog.info(domain, tag, 'HiCheckerTest beforeEach called');
    hichecker.removeCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
    hichecker.removeCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK);
    hichecker.removeCheckRule(hichecker.RULE_CAUTION_PRINT_LOG);
    hichecker.removeCheckRule(hichecker.RULE_CAUTION_TRIGGER_CRASH);
  })

  afterEach(():void => {
    hilog.info(domain, tag, 'HiCheckerTest afterEach called');
  })

  describe("HiCheckerTest", (): void => {
    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_0100
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_0100
     * @tc.desc   test hichecker interface
     */
    it('DFX_DFR_Hichecker_Interface_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_0100 start');
      hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      let tmp: boolean = hichecker.containsCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      hilog.info(domain, tag, 'add rule success!');
      expect(tmp).assertEqual(true);
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_0500
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_0500
     * @tc.desc   test hichecker interface
     */
    it('DFX_DFR_Hichecker_Interface_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_0500 start');
      hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      hichecker.addCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
      hilog.info(domain, tag, 'add rule success');
      expect(hichecker.containsCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS)).assertEqual(true);
      expect(hichecker.containsCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK)).assertEqual(true);
      expect(hichecker.containsCheckRule(hichecker.RULE_CAUTION_PRINT_LOG)).assertEqual(true);
      let tmp: bigint = (hichecker.RULE_THREAD_CHECK_SLOW_PROCESS |
                         hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK |
                         hichecker.RULE_CAUTION_PRINT_LOG);
      expect(hichecker.getRule() == tmp).assertEqual(true);
    })


    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_0200
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_0200
     * @tc.desc   test hichecker interface
     */
    it('DFX_DFR_Hichecker_Interface_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_0200 start');
      hichecker.addCheckRule(-1n);
      hilog.info(domain, tag, 'add wrong rule!');
      expect(hichecker.containsCheckRule(-1n)).assertEqual(false);
      hichecker.addCheckRule(0n);
      hilog.info(domain, tag, 'add wrong rule!');
      expect(hichecker.containsCheckRule(0n)).assertEqual(false);
      hichecker.addCheckRule(999999n);
      hilog.info(domain, tag, 'add wrong rule!');
      expect(hichecker.containsCheckRule(999999n)).assertEqual(false);
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_1200
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_1200
     * @tc.desc   test hichecker interface
     */
    it('DFX_DFR_Hichecker_Interface_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_1200 start');
      hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      expect(hichecker.containsCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS)).assertEqual(true);
      hilog.info(domain, tag, 'add rule success!');
      hichecker.removeCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      expect(hichecker.containsCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS)).assertEqual(false);
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_0800
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_0800
     * @tc.desc   test hichecker interface
     */
    it('DFX_DFR_Hichecker_Interface_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_0800 start');
      hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      hichecker.addCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
      hilog.info(domain, tag, 'add rule success!');
      let tmp: bigint = (hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
      hichecker.removeCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      expect(hichecker.getRule() == tmp).assertEqual(true);
      hichecker.removeCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
      expect(hichecker.getRule() == 0n).assertEqual(true);
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_1300
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_1300
     * @tc.desc   test hichecker interface
     */
    it('DFX_DFR_Hichecker_Interface_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_1300 start');
      hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
      hichecker.addCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
      hilog.info(domain, tag, 'add rule success!');
      let tmp : bigint = (hichecker.RULE_THREAD_CHECK_SLOW_PROCESS |
                          hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
      hichecker.removeCheckRule(-1n);
      expect(hichecker.getRule() == tmp).assertEqual(true);
      hichecker.removeCheckRule(0n);
      expect(hichecker.getRule() == tmp).assertEqual(true);
      hichecker.removeCheckRule(999999n);
      expect(hichecker.getRule() == tmp).assertEqual(true);
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_2200
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_2200
     * @tc.desc   addCheckRule with normal parameter
     */
    it('DFX_DFR_Hichecker_Interface_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_2200 start');
      try {
        hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
        hichecker.addCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
        hilog.info(domain, tag, 'add rule success!');
        expect(hichecker.containsCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS)).assertEqual(true);
        expect(hichecker.containsCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK)).assertEqual(true);
        expect(hichecker.containsCheckRule(hichecker.RULE_CAUTION_PRINT_LOG)).assertEqual(true);
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}d', error.code);
        hilog.info(domain, tag, '%{public}s', error.message);
        expect(error.code == 401).assertEqual(true);
      }
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_2300
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_2300
     * @tc.desc   removeCheckRule with normal parameter
     */
    it('DFX_DFR_Hichecker_Interface_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_2300 start');
      try {
        hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
        hichecker.addCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
        hilog.info(domain, tag, 'add rule success!');
        let tmp: bigint = (hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
        hichecker.removeCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
        expect(hichecker.getRule() == tmp).assertEqual(true);
        hichecker.removeCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
        expect(hichecker.getRule() == 0n).assertEqual(true);
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}d', error.code);
        hilog.info(domain, tag, '%{public}s', error.message);
        expect(error.code == 401).assertEqual(true);
      }
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_2400
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_2400
     * @tc.desc   containsCheckRule with normal parameter
     */
    it('DFX_DFR_Hichecker_Interface_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_2400 start');
      try {
        hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS);
        hichecker.addCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK | hichecker.RULE_CAUTION_PRINT_LOG);
        hilog.info(domain, tag, 'add rule success!');
        expect(hichecker.containsCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS)).assertEqual(true);
        expect(hichecker.containsCheckRule(hichecker.RULE_CHECK_ABILITY_CONNECTION_LEAK)).assertEqual(true);
        expect(hichecker.containsCheckRule(hichecker.RULE_CAUTION_PRINT_LOG)).assertEqual(true);
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}d', error.code);
        hilog.info(domain, tag, '%{public}s', error.message);
        expect(error.code == 401).assertEqual(true);
      }
    })

    /**
     * @tc.number DFX_DFR_Hichecker_Interface_Static_2800
     * @tc.name   DFX_DFR_Hichecker_Interface_Static_2800
     * @tc.desc   containsCheckRule with normal parameter
     */
    it('DFX_DFR_Hichecker_Interface_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      hilog.info(domain, tag, 'DFX_DFR_Hichecker_Interface_Static_2800 start');
      try {
        hichecker.addCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS | hichecker.RULE_CHECK_ARKUI_PERFORMANCE);
        console.log('add rule success!');
        expect(hichecker.containsCheckRule(hichecker.RULE_THREAD_CHECK_SLOW_PROCESS)).assertEqual(true);
        expect(hichecker.containsCheckRule(hichecker.RULE_CHECK_ARKUI_PERFORMANCE)).assertEqual(true);
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}d', error.code);
        hilog.info(domain, tag, '%{public}s', error.message);
        expect(error.code == 401).assertEqual(true);
      }
    })
  })
}