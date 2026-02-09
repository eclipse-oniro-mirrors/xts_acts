'use static';
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function actsBadgeTest() {
  describe('actsBadgeTest', () => {
    beforeAll(() => {
      console.info("ImageSupportSvg2Test beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information02.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageSupportSvg2Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/BadgeStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageSupportSvg2Test state pages:" + JSON.stringify(pages));
        if (!("BadgeStyle" == pages.name)) {
          console.info("get ImageSupportSvg2Test pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push ImageSupportSvg2Test page error:" + err);
      }
      console.info("ImageSupportSvg2Test beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ImageSupportSvg2Test after each called");
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontWeight_0100
     * @tc.number ArkUX_Stage_Badge_FontWeight_0100
     * @tc.desc   Badge FontWeight Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontWeight_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0100 START');
      let strJson = inspector.getInspectorByKey('Badge_FontWeight_0100');
      console.info("ArkUX_Stage_Badge_FontWeight_0100 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('ArkUX_Stage_Badge_FontWeight_0100 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontWeight_0200
     * @tc.number ArkUX_Stage_Badge_FontWeight_0200
     * @tc.desc   Badge FontWeight Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontWeight_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0200 START');
      let strJson = inspector.getInspectorByKey('Badge_FontWeight_0200');
      console.info("ArkUX_Stage_Badge_FontWeight_0100 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('ArkUX_Stage_Badge_FontWeight_0100 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontWeight_0300
     * @tc.number ArkUX_Stage_Badge_FontWeight_0300
     * @tc.desc   Badge FontWeight Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontWeight_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0300 START');
      console.info('ArkUX_Stage_Badge_FontWeight_0300 START');
      let strJson = inspector.getInspectorByKey('Badge_FontWeight_0300');
      console.info("ArkUX_Stage_Badge_FontWeight_0100 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('ArkUX_Stage_Badge_FontWeight_0100 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontWeight_0400
     * @tc.number ArkUX_Stage_Badge_FontWeight_0400
     * @tc.desc   Badge FontWeight Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontWeight_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0400 START');
      let strJson = inspector.getInspectorByKey('Badge_FontWeight_0400');
      console.info("ArkUX_Stage_Badge_FontWeight_0400 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontWeight')).assertEqual('900');
      console.info('ArkUX_Stage_Badge_FontWeight_0400 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontWeight_0500
     * @tc.number ArkUX_Stage_Badge_FontWeight_0500
     * @tc.desc   Badge FontWeight Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontWeight_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0500 START');
      let strJson = inspector.getInspectorByKey('Badge_FontWeight_0500');
      console.info("ArkUX_Stage_Badge_FontWeight_0500 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontWeight')).assertEqual('900');
      console.info('ArkUX_Stage_Badge_FontWeight_0500 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontWeight_0600
     * @tc.number ArkUX_Stage_Badge_FontWeight_0600
     * @tc.desc   Badge FontWeight Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontWeight_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_FontWeight_0600 START');
      let strJson = inspector.getInspectorByKey('Badge_FontWeight_0600');
      console.info("ArkUX_Stage_Badge_FontWeight_0600 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('ArkUX_Stage_Badge_FontWeight_0600 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_BadgeSize_0700
     * @tc.number ArkUX_Stage_Badge_BadgeSize_0700
     * @tc.desc   Badge BadgeSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_BadgeSize_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BadgeSize_0100 START');
      let strJson = inspector.getInspectorByKey('Badge_badgeSize_0100');
      console.info("ArkUX_Stage_Badge_BadgeSize_0100 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('badgeSize')).assertEqual('16.00vp');
      console.info('ArkUX_Stage_Badge_BadgeSize_0100 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_BadgeSize_0800
     * @tc.number ArkUX_Stage_Badge_BadgeSize_0800
     * @tc.desc   Badge BadgeSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_BadgeSize_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BadgeSize_0200 START');
      let strJson = inspector.getInspectorByKey('Badge_badgeSize_0200');
      console.info("ArkUX_Stage_Badge_BadgeSize_0200 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('badgeSize')).assertEqual('16.00vp');
      console.info('ArkUX_Stage_Badge_BadgeSize_0200 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_BadgeSize_0900
     * @tc.number ArkUX_Stage_Badge_BadgeSize_0900
     * @tc.desc   Badge BadgeSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_BadgeSize_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BadgeSize_0300 START');
      let strJson = inspector.getInspectorByKey('Badge_badgeSize_0300');
      console.info("ArkUX_Stage_Badge_BadgeSize_0300 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('badgeSize')).assertEqual('20.00fp');
      console.info('ArkUX_Stage_Badge_BadgeSize_0300 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_BadgeSize_1000
     * @tc.number ArkUX_Stage_Badge_BadgeSize_1000
     * @tc.desc   Badge BadgeSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_BadgeSize_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_BadgeSize_0400 START');
      let strJson = inspector.getInspectorByKey('Badge_badgeSize_0400');
      console.info("ArkUX_Stage_Badge_BadgeSize_0400 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('badgeSize')).assertEqual('20.00fp');
      console.info('ArkUX_Stage_Badge_BadgeSize_0400 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_BadgeSize_1100
     * @tc.number ArkUX_Stage_Badge_BadgeSize_1100
     * @tc.desc   Badge BadgeSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_BadgeSize_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_badgeSize_0500 START');
      let strJson = inspector.getInspectorByKey('Badge_badgeSize_0500');
      console.info("ArkUX_Stage_Badge_FontWeight_0500 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('badgeSize')).assertEqual("40.00vp");
      console.info('ArkUX_Stage_Badge_badgeSize_0500 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontSize_1200
     * @tc.number ArkUX_Stage_Badge_FontSize_1200
     * @tc.desc   Badge FontSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontSize_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_fontSize_0100 START');
      let strJson = inspector.getInspectorByKey('Badge_fontSize_0100');
      console.info("ArkUX_Stage_Badge_fontSize_0100 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual("10.00vp");
      console.info('ArkUX_Stage_Badge_fontSize_0100 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontSiz_1300
     * @tc.number ArkUX_Stage_Badge_FontSiz_1300
     * @tc.desc   Badge FontSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontSiz_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_fontSize_0200 START');
      let strJson = inspector.getInspectorByKey('Badge_fontSize_0200');
      console.info("ArkUX_Stage_Badge_fontSize_0200 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual("10.00vp");
      console.info('ArkUX_Stage_Badge_fontSize_0200 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontSize_1400
     * @tc.number ArkUX_Stage_Badge_FontSize_1400
     * @tc.desc   Badge FontSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontSize_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_fontSize_0300 START');
      let strJson = inspector.getInspectorByKey('Badge_fontSize_0300');
      console.info("ArkUX_Stage_Badge_fontSize_0300 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual("20.00fp");
      console.info('ArkUX_Stage_Badge_fontSize_0300 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontSize_1500
     * @tc.number ArkUX_Stage_Badge_FontSize_1500
     * @tc.desc   Badge FontSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontSize_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_fontSize_0400 START');
      let strJson = inspector.getInspectorByKey('Badge_fontSize_0400');
      console.info("ArkUX_Stage_Badge_fontSize_0400 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual("20.00fp");
      console.info('ArkUX_Stage_Badge_fontSize_0400 END ');
      done();
    });

    /**
     * @tc.name   ArkUX_Stage_Badge_FontSize_1600
     * @tc.number ArkUX_Stage_Badge_FontSize_1600
     * @tc.desc   Badge FontSize Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUX_Stage_Badge_FontSize_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_Badge_fontSize_0500 START');
      let strJson = inspector.getInspectorByKey('Badge_fontSize_0500');
      console.info("ArkUX_Stage_Badge_fontSize_0500 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('style')) + "---" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('style'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('style')).getString('fontSize')).assertEqual("40.00vp");
      console.info('ArkUX_Stage_Badge_fontSize_0500 END ');
      done();
    });
  })
}