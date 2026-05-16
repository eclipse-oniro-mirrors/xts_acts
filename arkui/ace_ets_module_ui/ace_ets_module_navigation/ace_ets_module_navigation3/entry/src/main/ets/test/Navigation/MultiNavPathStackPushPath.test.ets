/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import router from '@ohos.router';
import { MultiNavPathStack, SplitPolicy } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/common/Common';

export default function MultiNavPathStackPushPathTest() {
  describe('MultiNavPathStackPushPathTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MultiNavPathStackPushPathTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/MultiNavPathStackPushPath',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MultiNavPathStackPushPathTest state pages: " + JSON.stringify(pages));
        if (!("MultiNavPathStackPushPath" == pages.name)) {
          console.info("get MultiNavPathStackPushPathTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MultiNavPathStackPushPathTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MultiNavPathStackPushPathTest page error: " + err);
      }
      done();
    });

    afterAll(async () => {
      //清除AppStorage中的值
      AppStorage.delete('MultiNavPathStackPushPath')
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'afterAll: all tests finished');
    });

    /**
     * @tc.name   multiNavPathStackPushPath_animated_false_policy_homepage_0100
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATH_ANIMATED_FALSE_POLICY_HOMEPAGE_0100
     * @tc.desc   Test MultiNavPathStack pushPath with animated=false and policy=HOME_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPath_animated_false_policy_homepage_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_homepage_0100 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack:MultiNavPathStack  = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        // 跳转页面
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        // 记得加延时等待页面跳转成功
        await CommonFunc.sleep(1000)
        // 能找到跳转后页面中的组件id MultiNavPathStackPushPath_text_home 证明跳转页面成功
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_home');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageHome');
        // 返回上一层页面
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_homepage_0100 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_homepage_0100 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackReplacePath_animated_false_0100
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_REPLACEPATH_ANIMATED_FALSE_0100
     * @tc.desc   Test MultiNavPathStack replacePath with animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackReplacePath_animated_false_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePath_animated_false_0100 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        // 先跳转到首页
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        // 验证首页已加载
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_home');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageHome');
        // 使用replacePath替换当前页面为详情页，animated=false
        pageStack.replacePath({ name: 'TestPageDetail' }, false)
        await CommonFunc.sleep(1000)
        // 验证详情页已替换成功
        strJson = getInspectorByKey('MultiNavPathStackPushPath_text_detail');
        obj = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageDetail');
        // 返回上一层页面
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePath_animated_false_0100 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePath_animated_false_0100 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPath_animated_false_policy_homepage_0200
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATH_ANIMATED_FALSE_POLICY_HOMEPAGE_0200
     * @tc.desc   Test MultiNavPathStack pushPath with animated=false and policy=HOME_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPath_animated_false_policy_homepage_0200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_homepage_0200 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.HOME_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_home');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageHome');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_homepage_0200 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_homepage_0200 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPath_animated_false_policy_fullpage_0300
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATH_ANIMATED_FALSE_POLICY_FULLPAGE_0300
     * @tc.desc   Test MultiNavPathStack pushPath with animated=false and policy=FULL_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPath_animated_false_policy_fullpage_0300', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_fullpage_0300 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageFull' }, false, SplitPolicy.FULL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_full');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageFull');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_fullpage_0300 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_animated_false_policy_fullpage_0300 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPath_options_policy_homepage_0400
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATH_OPTIONS_POLICY_HOMEPAGE_0400
     * @tc.desc   Test MultiNavPathStack pushPath with options and policy=HOME_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPath_options_policy_homepage_0400', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_options_policy_homepage_0400 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, { animated: false }, SplitPolicy.HOME_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_home');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageHome');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_options_policy_homepage_0400 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_options_policy_homepage_0400 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPath_options_policy_fullpage_0500
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATH_OPTIONS_POLICY_FULLPAGE_0500
     * @tc.desc   Test MultiNavPathStack pushPath with options and policy=FULL_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPath_options_policy_fullpage_0500', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_options_policy_fullpage_0500 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageFull' }, { animated: false }, SplitPolicy.FULL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_full');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageFull');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_options_policy_fullpage_0500 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPath_options_policy_fullpage_0500 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPathByName_policy_detailpage_0600
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATHBYNAME_POLICY_DETAILPAGE_0600
     * @tc.desc   Test MultiNavPathStack pushPathByName with policy=DETAIL_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPathByName_policy_detailpage_0600', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_policy_detailpage_0600 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPathByName('TestPageDetail', '{}', false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_detail');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageDetail');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_policy_detailpage_0600 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_policy_detailpage_0600 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPathByName_policy_fullpage_0700
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATHBYNAME_POLICY_FULLPAGE_0700
     * @tc.desc   Test MultiNavPathStack pushPathByName with policy=FULL_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPathByName_policy_fullpage_0700', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_policy_fullpage_0700 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPathByName('TestPageFull', '', false, SplitPolicy.FULL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_full');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageFull');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_policy_fullpage_0700 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_policy_fullpage_0700 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPathByName_onPop_animated_true_0800
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATHBYNAME_ONPOP_ANIMATED_TRUE_0800
     * @tc.desc   Test MultiNavPathStack pushPathByName with onPop and animated=true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPathByName_onPop_animated_true_0800', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_animated_true_0800 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let onPopCalled = false;
        pageStack.pushPathByName('TestPageDetail', '', (popInfo: ESObject) => {
          onPopCalled = true;
        }, true, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_detail');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageDetail');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_animated_true_0800 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_animated_true_0800 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPathByName_onPop_policy_detailpage_0900
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATHBYNAME_ONPOP_POLICY_DETAILPAGE_0900
     * @tc.desc   Test MultiNavPathStack pushPathByName with onPop and policy=DETAIL_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPathByName_onPop_policy_detailpage_0900', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_policy_detailpage_0900 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPathByName('TestPageDetail', '{}', (popInfo: ESObject) => {
        }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_detail');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageDetail');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_policy_detailpage_0900 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_policy_detailpage_0900 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPushPathByName_onPop_policy_fullpage_1000
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_PUSHPATHBYNAME_ONPOP_POLICY_FULLPAGE_1000
     * @tc.desc   Test MultiNavPathStack pushPathByName with onPop and policy=FULL_PAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPushPathByName_onPop_policy_fullpage_1000', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_policy_fullpage_1000 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPathByName('TestPageFull', '{}', (popInfo: ESObject) => {
        }, false, SplitPolicy.FULL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_full');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageFull');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_policy_fullpage_1000 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPushPathByName_onPop_policy_fullpage_1000 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackReplacePath_options_1100
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_REPLACEPATH_OPTIONS_1100
     * @tc.desc   Test MultiNavPathStack replacePath with options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackReplacePath_options_1100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePath_options_1100 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_home');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageHome');
        pageStack.replacePath({ name: 'TestPageDetail' }, { animated: false })
        await CommonFunc.sleep(1000)
        strJson = getInspectorByKey('MultiNavPathStackPushPath_text_detail');
        obj = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageDetail');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePath_options_1100 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePath_options_1100 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackReplacePathByName_animated_false_1200
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_REPLACEPATHBYNAME_ANIMATED_FALSE_1200
     * @tc.desc   Test MultiNavPathStack replacePathByName with animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackReplacePathByName_animated_false_1200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePathByName_animated_false_1200 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let strJson: string = getInspectorByKey('MultiNavPathStackPushPath_text_home');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageHome');
        pageStack.replacePathByName('TestPageDetail', '{}', false)
        await CommonFunc.sleep(1000)
        strJson = getInspectorByKey('MultiNavPathStackPushPath_text_detail');
        obj = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('TestPageDetail');
        pageStack.pop()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePathByName_animated_false_1200 END END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackReplacePathByName_animated_false_1200 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackRemoveByIndexes_empty_1300
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_REMOVEBYINDEXES_EMPTY_1300
     * @tc.desc   Test MultiNavPathStack removeByIndexes with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackRemoveByIndexes_empty_1300', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackRemoveByIndexes_empty_1300 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let result = pageStack.removeByIndexes([])
        expect(result).assertEqual(0)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackRemoveByIndexes_empty_1300 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackRemoveByIndexes_empty_1300 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackRemoveByName_empty_1400
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_REMOVEBYNAME_EMPTY_1400
     * @tc.desc   Test MultiNavPathStack removeByName with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackRemoveByName_empty_1400', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackRemoveByName_empty_1400 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let result = pageStack.removeByName('')
        expect(result).assertEqual(0)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackRemoveByName_empty_1400 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackRemoveByName_empty_1400 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPop_animated_true_1500
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_POP_ANIMATED_TRUE_1500
     * @tc.desc   Test MultiNavPathStack pop with animated=true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPop_animated_true_1500', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPop_animated_true_1500 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let result = pageStack.pop(true)
        expect(result).not().assertNull()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPop_animated_true_1500 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPop_animated_true_1500 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPop_result_animated_false_1600
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_POP_RESULT_ANIMATED_FALSE_1600
     * @tc.desc   Test MultiNavPathStack pop with result and animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPop_result_animated_false_1600', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPop_result_animated_false_1600 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let result = pageStack.pop('test', false)
        expect(result).not().assertNull()
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPop_result_animated_false_1600 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPop_result_animated_false_1600 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPopToName_empty_animated_false_1700
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_POPTONAME_EMPTY_ANIMATED_FALSE_1700
     * @tc.desc   Test MultiNavPathStack popToName with empty string and animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPopToName_empty_animated_false_1700', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToName_empty_animated_false_1700 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let result = pageStack.popToName('', false)
        expect(result).assertEqual(-1)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToName_empty_animated_false_1700 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToName_empty_animated_false_1700 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPopToName_result_empty_animated_false_1800
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_POPTONAME_RESULT_EMPTY_ANIMATED_FALSE_1800
     * @tc.desc   Test MultiNavPathStack popToName with result, empty string and animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPopToName_result_empty_animated_false_1800', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToName_result_empty_animated_false_1800 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let result = pageStack.popToName('','test', false)
        expect(result).assertEqual(-1)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToName_result_empty_animated_false_1800 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToName_result_empty_animated_false_1800 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPopToIndex_animated_true_1900
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_POPTOINDEX_ANIMATED_TRUE_1900
     * @tc.desc   Test MultiNavPathStack popToIndex with animated=true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPopToIndex_animated_true_1900', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToIndex_animated_true_1900 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        pageStack.popToIndex(0, true)
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToIndex_animated_true_1900 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToIndex_animated_true_1900 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackPopToIndex_result_animated_false_2000
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_POPTOINDEX_RESULT_ANIMATED_FALSE_2000
     * @tc.desc   Test MultiNavPathStack popToIndex with result and animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackPopToIndex_result_animated_false_2000', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToIndex_result_animated_false_2000 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        pageStack.popToIndex(0, 'test', false)
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToIndex_result_animated_false_2000 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackPopToIndex_result_animated_false_2000 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackMoveToTop_animated_false_2100
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_MOVETOTOP_ANIMATED_FALSE_2100
     * @tc.desc   Test MultiNavPathStack moveToTop with animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackMoveToTop_animated_false_2100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackMoveToTop_animated_false_2100 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        let result = pageStack.moveToTop('TestPageHome', false)
        expect(result).assertLarger(-1)
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackMoveToTop_animated_false_2100 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackMoveToTop_animated_false_2100 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackMoveIndexToTop_animated_true_2200
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_MOVEINDEXTOTOP_ANIMATED_TRUE_2200
     * @tc.desc   Test MultiNavPathStack moveIndexToTop with animated=true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackMoveIndexToTop_animated_true_2200', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackMoveIndexToTop_animated_true_2200 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        pageStack.moveIndexToTop(0, true)
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackMoveIndexToTop_animated_true_2200 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackMoveIndexToTop_animated_true_2200 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackClear_animated_true_2300
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_CLEAR_ANIMATED_TRUE_2300
     * @tc.desc   Test MultiNavPathStack clear with animated=true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackClear_animated_true_2300', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackClear_animated_true_2300 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        pageStack.clear(true)
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackClear_animated_true_2300 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackClear_animated_true_2300 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackClear_animated_false_2400
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_CLEAR_ANIMATED_FALSE_2400
     * @tc.desc   Test MultiNavPathStack clear with animated=false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackClear_animated_false_2400', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackClear_animated_false_2400 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        pageStack.pushPath({ name: 'TestPageHome' }, false, SplitPolicy.DETAIL_PAGE)
        await CommonFunc.sleep(1000)
        pageStack.clear(false)
        await CommonFunc.sleep(1000)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackClear_animated_false_2400 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackClear_animated_false_2400 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackGetParamByIndex_boundary_2500
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_GETPARAMBYINDEX_BOUNDARY_2500
     * @tc.desc   Test MultiNavPathStack getParamByIndex with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackGetParamByIndex_boundary_2500', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetParamByIndex_boundary_2500 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let result = pageStack.getParamByIndex(0)
        expect(result).assertUndefined()
        result = pageStack.getParamByIndex(-1)
        expect(result).assertUndefined()
        result = pageStack.getParamByIndex(9999)
        expect(result).assertUndefined()
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetParamByIndex_boundary_2500 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetParamByIndex_boundary_2500 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackGetParamByName_empty_2600
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_GETPARAMBYNAME_EMPTY_2600
     * @tc.desc   Test MultiNavPathStack getParamByName with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackGetParamByName_empty_2600', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetParamByName_empty_2600 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let result = pageStack.getParamByName('')
        expect(result.length).assertEqual(0)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetParamByName_empty_2600 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetParamByName_empty_2600 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

    /**
     * @tc.name   multiNavPathStackGetIndexByName_empty_2700
     * @tc.number SUB_ARKUI_MULTINAVPATHSTACK_GETINDEXBYNAME_EMPTY_2700
     * @tc.desc   Test MultiNavPathStack getIndexByName with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('multiNavPathStackGetIndexByName_empty_2700', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetIndexByName_empty_2700 START');
      try {
        await CommonFunc.sleep(1000);
        let pageStack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('MultiNavPathStackPushPath')!
        let result = pageStack.getIndexByName('')
        expect(result.length).assertEqual(0)
        hilog.info(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetIndexByName_empty_2700 END');
      } catch (err) {
        hilog.error(0x0000, 'MultiNavPathStackPushPathTest', 'multiNavPathStackGetIndexByName_empty_2700 Error: ' + JSON.stringify(err));
        expect(true).assertFalse();
      }
    });

  });
}
