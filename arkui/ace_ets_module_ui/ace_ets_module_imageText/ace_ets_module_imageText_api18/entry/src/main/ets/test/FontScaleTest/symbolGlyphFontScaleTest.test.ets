/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function symbolGlyphFontScaleTest() {
  describe('symbolGlyphFontScaleTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FontScaleTest/symbolGlyphFontScaleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get symbolGlyphFontScaleTest state success " + JSON.stringify(pages));
        if (!("symbolGlyphFontScaleTest" == pages.name)) {
          console.info("get symbolGlyphFontScaleTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push symbolGlyphFontScaleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push symbolGlyphFontScaleTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("symbolGlyphFontScaleTest after each called");
    });

    /**
     * @tc.name   symbolGlyphFontScaleTest0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   symbolGlyphFontScaleTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0001', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0001 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph1 = getInspectorByKey('symbolGlyph1');
        let obj: ESObject = JSON.parse(symbolGlyph1);
        console.log('symbolGlyphFontScaleTest0001---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0001---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("1.000000");
		expect(obj.$attrs.minFontScale).assertEqual("1.000000");
        console.info("[symbolGlyphFontScaleTest0001] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   symbolGlyphFontScaleTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0002', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0002 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph2 = getInspectorByKey('symbolGlyph2');
        let obj: ESObject = JSON.parse(symbolGlyph2);
        console.log('symbolGlyphFontScaleTest0002---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0002---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.500000");
        console.info("[symbolGlyphFontScaleTest0002] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   symbolGlyphFontScaleTest0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0003', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0003 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph3 = getInspectorByKey('symbolGlyph3');
        let obj: ESObject = JSON.parse(symbolGlyph3);
        console.log('symbolGlyphFontScaleTest0003---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0003---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("2.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.500000");
        console.info("[symbolGlyphFontScaleTest0003] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   symbolGlyphFontScaleTest0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0004', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0004 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph4 = getInspectorByKey('symbolGlyph4');
        let obj: ESObject = JSON.parse(symbolGlyph4);
        console.log('symbolGlyphFontScaleTest0004---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0004---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("1.000000");
		expect(obj.$attrs.minFontScale).assertEqual("0.000000");
        console.info("[symbolGlyphFontScaleTest0004] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   symbolGlyphFontScaleTest0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0005', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0005 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph5 = getInspectorByKey('symbolGlyph5');
        let obj: ESObject = JSON.parse(symbolGlyph5);
        console.log('symbolGlyphFontScaleTest0005---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0005---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("1.000000");
		expect(obj.$attrs.minFontScale).assertEqual("1.000000");
        console.info("[symbolGlyphFontScaleTest0005] end");
    });

    /**
     * @tc.name   symbolGlyphFontScaleTest0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   symbolGlyphFontScaleTest0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0006', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0006 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph6 = getInspectorByKey('symbolGlyph6');
        let obj: ESObject = JSON.parse(symbolGlyph6);
        console.log('symbolGlyphFontScaleTest0006---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0006---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[symbolGlyphFontScaleTest0006] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0007
     * @tc.number SUB_ACE_BASIC_ETS_API_0007
     * @tc.desc   symbolGlyphFontScaleTest0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0007', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0007 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph7 = getInspectorByKey('symbolGlyph7');
        let obj: ESObject = JSON.parse(symbolGlyph7);
        console.log('symbolGlyphFontScaleTest0007---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0007---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[symbolGlyphFontScaleTest0007] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0008
     * @tc.number SUB_ACE_BASIC_ETS_API_0008
     * @tc.desc   symbolGlyphFontScaleTest0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0008', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0008 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph8 = getInspectorByKey('symbolGlyph8');
        let obj: ESObject = JSON.parse(symbolGlyph8);
        console.log('symbolGlyphFontScaleTest0008---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0008---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.500000");
		expect(obj.$attrs.minFontScale).assertEqual("0.600000");
        console.info("[symbolGlyphFontScaleTest0008] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0009
     * @tc.number SUB_ACE_BASIC_ETS_API_0009
     * @tc.desc   symbolGlyphFontScaleTest0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0009', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0009 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph9 = getInspectorByKey('symbolGlyph9');
        let obj: ESObject = JSON.parse(symbolGlyph9);
        console.log('symbolGlyphFontScaleTest0009---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0009---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("2.000000");
		expect(obj.$attrs.minFontScale).assertEqual("1.000000");
        console.info("[symbolGlyphFontScaleTest0009] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   symbolGlyphFontScaleTest0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0010', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0010 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph10 = getInspectorByKey('symbolGlyph10');
        let obj: ESObject = JSON.parse(symbolGlyph10);
        console.log('symbolGlyphFontScaleTest0010---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0010---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[symbolGlyphFontScaleTest0010] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0011
     * @tc.number SUB_ACE_BASIC_ETS_API_0011
     * @tc.desc   symbolGlyphFontScaleTest0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0011', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0011 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph11 = getInspectorByKey('symbolGlyph11');
        let obj: ESObject = JSON.parse(symbolGlyph11);
        console.log('symbolGlyphFontScaleTest0011---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0011---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[symbolGlyphFontScaleTest0011] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0012
     * @tc.number SUB_ACE_BASIC_ETS_API_0012
     * @tc.desc   symbolGlyphFontScaleTest0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0012', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0012 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph12 = getInspectorByKey('symbolGlyph12');
        let obj: ESObject = JSON.parse(symbolGlyph12);
        console.log('symbolGlyphFontScaleTest0012---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0012---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[symbolGlyphFontScaleTest0012] end");
    });
	
    /**
     * @tc.name   symbolGlyphFontScaleTest0013
     * @tc.number SUB_ACE_BASIC_ETS_API_0013
     * @tc.desc   symbolGlyphFontScaleTest0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('symbolGlyphFontScaleTest0013', Level.LEVEL1, async () => {
        let driver = Driver.create();
        console.info('symbolGlyphFontScaleTest symbolGlyphFontScaleTest0013 START');
        await CommonFunc.sleep(1000);
        let symbolGlyph13 = getInspectorByKey('symbolGlyph13');
        let obj: ESObject = JSON.parse(symbolGlyph13);
        console.log('symbolGlyphFontScaleTest0013---' + obj.$attrs.maxFontScale)
		console.log('symbolGlyphFontScaleTest0013---' + obj.$attrs.minFontScale)
        expect(obj.$attrs.maxFontScale).assertEqual("3.200000");
		expect(obj.$attrs.minFontScale).assertEqual("0.850000");
        console.info("[symbolGlyphFontScaleTest0013] end");
    });
  })
}
