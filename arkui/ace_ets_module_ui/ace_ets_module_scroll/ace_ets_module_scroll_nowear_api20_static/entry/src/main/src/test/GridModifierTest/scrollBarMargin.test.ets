'use static'

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

import CommonFunc from '../common/Common';
import Utils from '../common/Utils';
import { startAbility, UtilsTest } from '../Util.test.ets';

let want: Want;
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function scrollBarMarginModifierTest() {
  describe('ActsScrollBarMarginModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility');
    })
    beforeEach(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridModifier/GridModifier_scrollBarMargin',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextLineSpacingTest state pages: ' + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          console.info('get TextLineSpacingTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('push TextLineSpacingTest page error: ' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   test_scrollBarMargin_Modifier
     * @tc.name     test_scrollBarMargin_Modifier
     * @tc.desc     test_scrollBarMargin_Modifier
     * @tc.level    Level.LEVEL0
     */
    it('test_scrollBarMargin_Modifier', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('scrollBarMargin_001'))
        .getElement('$attrs')
        .getString('scrollBarMargin'))
        .assertEqual('ScrollBarMargin start: 45.00vp, end: 70.00vp');
      done();
    })
  })
}