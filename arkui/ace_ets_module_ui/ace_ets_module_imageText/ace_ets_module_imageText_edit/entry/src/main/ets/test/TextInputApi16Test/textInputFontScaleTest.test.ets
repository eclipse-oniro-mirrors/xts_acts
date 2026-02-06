/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function textInputFontScaleTest() {
  describe('textInputFontScaleTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi16/textInputFontScale',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputFontScaleTest state success " + JSON.stringify(pages));
        if (!("textInputFontScale" == pages.name)) {
          console.info("get textInputFontScaleTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textInputFontScaleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputFontScaleTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textInputFontScaleTest after each called");
    });

    /**
     * @tc.name   textInputFontScaleTest0001
     * @tc.number textInputFontScaleTest0001
     * @tc.desc   Test textInputFontScaleTest abnormal value :undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0001', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0001 START');
        await CommonFunc.sleep(1000);
        let input1 = getInspectorByKey('input_FontScale1');
        let obj: ESObject = JSON.parse(input1);
        console.log('textInputFontScaleTest0001---' + obj.$attrs.maxFontScale)
        console.log('textInputFontScaleTest0001---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
        expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0001] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0002
     * @tc.number textInputFontScaleTest0002
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.string')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0002', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0002 START');
        await CommonFunc.sleep(1000);
        let input2 = getInspectorByKey('input_FontScale2');
        let obj: ESObject = JSON.parse(input2);
        console.log('textInputFontScaleTest0002---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0002---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.500000");
        console.info("[textInputFontScaleTest0002] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   Test textInputFontScaleTest Normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0003', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0003 START');
        await CommonFunc.sleep(1000);
        let input3 = getInspectorByKey('input_FontScale3');
        let obj: ESObject = JSON.parse(input3);
        console.log('textInputFontScaleTest0003---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0003---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("2.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.500000");
        console.info("[textInputFontScaleTest0003] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   Test textInputFontScaleTest abnormal value :less than minimum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0004', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0004 START');
        await CommonFunc.sleep(1000);
        let input4 = getInspectorByKey('input_FontScale4');
        let obj: ESObject = JSON.parse(input4);
        console.log('textInputFontScaleTest0004---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0004---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("1.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.000000");
        console.info("[textInputFontScaleTest0004] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   Test textInputFontScaleTest abnormal value :Greater than maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0005', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0005 START');
        await CommonFunc.sleep(1000);
        let input5 = getInspectorByKey('input_FontScale5');
        let obj: ESObject = JSON.parse(input5);
        console.log('textInputFontScaleTest0005---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0005---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("1.000000");
		expect(obj.$attrs.minFontScale).assertEqual("1.000000");
        console.info("[textInputFontScaleTest0005] end");
    });
	
	
    /**
     * @tc.name   textInputFontScaleTest0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.boolean')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0006', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0006 START');
        await CommonFunc.sleep(1000);
        let input6 = getInspectorByKey('input_FontScale6');
        let obj: ESObject = JSON.parse(input6);
        console.log('textInputFontScaleTest0006---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0006---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0006] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0007
     * @tc.number SUB_ACE_BASIC_ETS_API_0007
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.color')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0007', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0007 START');
        await CommonFunc.sleep(1000);
        let input7 = getInspectorByKey('input_FontScale7');
        let obj: ESObject = JSON.parse(input7);
        console.log('textInputFontScaleTest0007---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0007---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0007] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0008
     * @tc.number SUB_ACE_BASIC_ETS_API_0008
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.float')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0008', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0008 START');
        await CommonFunc.sleep(1000);
        let input8 = getInspectorByKey('input_FontScale8');
        let obj: ESObject = JSON.parse(input8);
        console.log('textInputFontScaleTest0008---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0008---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.500000");
		expect(obj.$attrs.minFontScale).assertEqual("0.600000");
        console.info("[textInputFontScaleTest0008] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0009
     * @tc.number SUB_ACE_BASIC_ETS_API_0009
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.integer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0009', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0009 START');
        await CommonFunc.sleep(1000);
        let input9 = getInspectorByKey('input_FontScale9');
        let obj: ESObject = JSON.parse(input9);
        console.log('textInputFontScaleTest0009---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0009---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("2.000000");
		expect(obj.$attrs.minFontScale).assertEqual("1.000000");
        console.info("[textInputFontScaleTest0009] end");
    });
	
	
    /**
     * @tc.name   textInputFontScaleTest0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.intarray')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0010', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0010 START');
        await CommonFunc.sleep(1000);
        let input10 = getInspectorByKey('input_FontScale10');
        let obj: ESObject = JSON.parse(input10);
        console.log('textInputFontScaleTest0010---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0010---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0010] end");
    });
	
    /**
     * @tc.name   textInputFontScaleTest0011
     * @tc.number SUB_ACE_BASIC_ETS_API_0011
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.pattern')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0011', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0011 START');
        await CommonFunc.sleep(1000);
        let input11 = getInspectorByKey('input_FontScale11');
        let obj: ESObject = JSON.parse(input11);
        console.log('textInputFontScaleTest0011---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0011---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0011] end");
    });
	
	
    /**
     * @tc.name   textInputFontScaleTest0012
     * @tc.number SUB_ACE_BASIC_ETS_API_0012
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.plural')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0012', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0012 START');
        await CommonFunc.sleep(1000);
        let input12 = getInspectorByKey('input_FontScale12');
        let obj: ESObject = JSON.parse(input12);
        console.log('textInputFontScaleTest0012---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0012---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0012] end");
    });
	
	
    /**
     * @tc.name   textInputFontScaleTest0013
     * @tc.number SUB_ACE_BASIC_ETS_API_0013
     * @tc.desc   Test textInputFontScaleTest reference value :$r('app.strarray')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textInputFontScaleTest0013', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textInputFontScaleTest textInputFontScaleTest0013 START');
        await CommonFunc.sleep(1000);
        let input13 = getInspectorByKey('input_FontScale13');
        let obj: ESObject = JSON.parse(input13);
        console.log('textInputFontScaleTest0013---' + obj.$attrs.maxFontScale)
		console.log('textInputFontScaleTest0013---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textInputFontScaleTest0013] end");
    });


  })
}
