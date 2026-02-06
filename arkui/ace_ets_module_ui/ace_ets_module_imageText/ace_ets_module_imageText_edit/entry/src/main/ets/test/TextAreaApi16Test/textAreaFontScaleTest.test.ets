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

export default function textAreaFontScaleTest() {
  describe('textAreaFontScaleTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi16/textAreaFontScaleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaFontScaleTest state success " + JSON.stringify(pages));
        if (!("textAreaFontScaleTest" == pages.name)) {
          console.info("get textAreaFontScaleTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textAreaFontScaleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaFontScaleTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaFontScaleTest after each called");
    });

    /**
     * @tc.name   textAreaFontScaleTest0001
     * @tc.number textAreaFontScaleTest0001
     * @tc.desc   Test textAreaFontScaleTest abnormal value :undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0001', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0001 START');
        await CommonFunc.sleep(1000);
        let area1 = getInspectorByKey('Api16_area1');
        let obj: ESObject = JSON.parse(area1);
        console.log('textAreaFontScaleTest0001---' + obj.$attrs.maxFontScale)
        console.log('textAreaFontScaleTest0001---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
        expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0001] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0002
     * @tc.number textAreaFontScaleTest0002
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.string')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0002', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0002 START');
        await CommonFunc.sleep(1000);
        let area2 = getInspectorByKey('Api16_area2');
        let obj: ESObject = JSON.parse(area2);
        console.log('textAreaFontScaleTest0002---' + obj.$attrs.maxFontScale)
        console.log('textAreaFontScaleTest0002---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.000000");
        expect(obj.$attrs.minFontScale).assertEqual("0.500000");
        console.info("[textAreaFontScaleTest0002] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0003
     * @tc.number textAreaFontScaleTest0003
     * @tc.desc   Test textAreaFontScaleTest Normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0003', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0003 START');
        await CommonFunc.sleep(1000);
        let area3 = getInspectorByKey('Api16_area3');
        let obj: ESObject = JSON.parse(area3);
        console.log('textAreaFontScaleTest0003---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0003---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("2.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.500000");
        console.info("[textAreaFontScaleTest0003] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0004
     * @tc.number textAreaFontScaleTest0004
     * @tc.desc   Test textAreaFontScaleTest abnormal value :less than minimum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0004', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0004 START');
        await CommonFunc.sleep(1000);
        let area4 = getInspectorByKey('Api16_area4');
        let obj: ESObject = JSON.parse(area4);
        console.log('textAreaFontScaleTest0004---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0004---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("1.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.000000");
        console.info("[textAreaFontScaleTest0004] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0005
     * @tc.number textAreaFontScaleTest0005
     * @tc.desc   Test textAreaFontScaleTest abnormal value :Greater than maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0005', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0005 START');
        await CommonFunc.sleep(1000);
        let area5 = getInspectorByKey('Api16_area5');
        let obj: ESObject = JSON.parse(area5);
        console.log('textAreaFontScaleTest0005---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0005---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("1.000000");
		expect(obj.$attrs.minFontScale).assertEqual("1.000000");
        console.info("[textAreaFontScaleTest0005] end");
    });

    /**
     * @tc.name   textAreaFontScaleTest0006
     * @tc.number textAreaFontScaleTest0006
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.boolean')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0006', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0006 START');
        await CommonFunc.sleep(1000);
        let area6 = getInspectorByKey('Api16_area6');
        let obj: ESObject = JSON.parse(area6);
        console.log('textAreaFontScaleTest0006---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0006---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0006] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0007
     * @tc.number textAreaFontScaleTest0007
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.color')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0007', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0007 START');
        await CommonFunc.sleep(1000);
        let area7 = getInspectorByKey('Api16_area7');
        let obj: ESObject = JSON.parse(area7);
        console.log('textAreaFontScaleTest0007---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0007---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0007] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0008
     * @tc.number textAreaFontScaleTest0008
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.float')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0008', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0008 START');
        await CommonFunc.sleep(1000);
        let area8 = getInspectorByKey('Api16_area8');
        let obj: ESObject = JSON.parse(area8);
        console.log('textAreaFontScaleTest0008---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0008---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.500000");
		expect(obj.$attrs.minFontScale).assertEqual("0.600000");
        console.info("[textAreaFontScaleTest0008] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0009
     * @tc.number textAreaFontScaleTest0009
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.integer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0009', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0009 START');
        await CommonFunc.sleep(1000);
        let area9 = getInspectorByKey('Api16_area9');
        let obj: ESObject = JSON.parse(area9);
        console.log('textAreaFontScaleTest0009---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0009---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("2.000000");
		expect(obj.$attrs.minFontScale).assertEqual("1.000000");
        console.info("[textAreaFontScaleTest0009] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0010
     * @tc.number textAreaFontScaleTest00010
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.intarray')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0010', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0010 START');
        await CommonFunc.sleep(1000);
        let area10 = getInspectorByKey('Api16_area10');
        let obj: ESObject = JSON.parse(area10);
        console.log('textAreaFontScaleTest0010---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0010---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0010] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0011
     * @tc.number textAreaFontScaleTest0011
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.pattern')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0011', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0011 START');
        await CommonFunc.sleep(1000);
        let area11 = getInspectorByKey('Api16_area11');
        let obj: ESObject = JSON.parse(area11);
        console.log('textAreaFontScaleTest0011---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0011---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0011] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0012
     * @tc.number textAreaFontScaleTest0012
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.plural')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0012', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0012 START');
        await CommonFunc.sleep(1000);
        let area12 = getInspectorByKey('Api16_area12');
        let obj: ESObject = JSON.parse(area12);
        console.log('textAreaFontScaleTest0012---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0012---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0012] end");
    });
	
    /**
     * @tc.name   textAreaFontScaleTest0013
     * @tc.number textAreaFontScaleTest0013
     * @tc.desc   Test textAreaFontScaleTest reference value :$r('app.strarray')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAreaFontScaleTest0013', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('textAreaFontScaleTest textAreaFontScaleTest0013 START');
        await CommonFunc.sleep(1000);
        let area13 = getInspectorByKey('Api16_area13');
        let obj: ESObject = JSON.parse(area13);
        console.log('textAreaFontScaleTest0013---' + obj.$attrs.maxFontScale)
		console.log('textAreaFontScaleTest0013---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[textAreaFontScaleTest0013] end");
    });
  })
}
