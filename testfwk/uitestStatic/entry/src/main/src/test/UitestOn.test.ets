/**
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
import { beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@kit.TestKit'
import  hilog  from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs = 1000;
const DeviceErrorCode = 17000005;

async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

function sleep(numberMillis: int) {
  const exitTime = new Date().getTime() + numberMillis;
  while (new Date().getTime() < exitTime) { }
  return
}

export default function uitestOnTest() {
  describe('uitestOnTest', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestOnTest loadup start!!!!!")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, "uitestOnTest loadup over!!!!!")
    })

    /**
     * @tc.name   testType_static
     * @tc.number uitestOnTest_0001
     * @tc.desc   find UiComponent by type attribute and get it's type attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testType_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testType_static Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('Text'));
        hilog.info(domain, tag, `testType_static text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue()
        if (text != null) {
          let type = await text.getType();
          hilog.info(domain, tag, `testType_static type, ${ JSON.stringify(type) }`);
          expect(type).assertEqual('Text');
        }
        let text1 = await driver.findComponent(ON.type('Text', MatchPattern.EQUALS));
        hilog.info(domain, tag, `testType_static text1, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue()
        if (text1 != null) {
          let type1 = await text1.getType();
          hilog.info(domain, tag, `testType_static testTypetype1, ${ JSON.stringify(type1) }`);
          expect(type1).assertEqual('Text');
        }

        let text2 = await driver.findComponent(ON.type('Text', MatchPattern.CONTAINS));
        hilog.info(domain, tag, `testType_static text2, ${ JSON.stringify(text2) }`);
        expect(text2 != null).assertTrue()
        if (text2 != null) {
          let type2 = await text2.getType();
          hilog.info(domain, tag, `testType_static type2 ${ JSON.stringify(type2) }`);
          expect(type2).assertEqual('Text');
        }

        let text3 = await driver.findComponent(ON.type('Tex', MatchPattern.STARTS_WITH));
        hilog.info(domain, tag, `testType_static text3, ${ JSON.stringify(text3) }`);
        expect(text3 != null).assertTrue()
        if (text3 != null) {
          let type3 = await text3.getType();
          hilog.info(domain, tag, `testType_static type3 ${ JSON.stringify(type3) }`);
          expect(type3).assertEqual('Text');
        }

        let text4 = await driver.findComponent(ON.type('ext', MatchPattern.ENDS_WITH));
        hilog.info(domain, tag, `testType_static text4, ${ JSON.stringify(text4) }`);
        expect(text4 != null).assertTrue()
        if (text4 != null) {
          let type4 = await text4.getType();
          hilog.info(domain, tag, `testType_static type4 ${ JSON.stringify(type4) }`);
          expect(type4).assertEqual('Text');
        }

      } catch(error) {
        hilog.info(domain, tag, `testType_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testType_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testId_static
     * @tc.number uitestOnTest_0002
     * @tc.desc   find UiComponent by id attribute and get it's id attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testId_static Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.id('my-key', MatchPattern.CONTAINS));
        hilog.info(domain, tag, `testId_static text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue();
        if (text != null) {
          let id = await text.getId();
          hilog.info(domain, tag, `testId_static id, ${ JSON.stringify(id) }`);
          expect(id == 'my-key').assertTrue();
        }

        let text1 = await driver.findComponent(ON.id('my-key'));
        hilog.info(domain, tag, `testId_static text1, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue();
        if (text1 != null) {
          let id1 = await text1.getId();
          hilog.info(domain, tag, `testId_static id, ${ JSON.stringify(id1) }`);
          expect(id1 == 'my-key').assertTrue();
        }

        let text2 = await driver.findComponent(ON.id('my-key', MatchPattern.EQUALS));
        hilog.info(domain, tag, `testId_static text2, ${ JSON.stringify(text2) }`);
        expect(text2 != null).assertTrue();
        if (text2 != null) {
          let id2 = await text2.getId();
          hilog.info(domain, tag, `testId_static id2 , ${ JSON.stringify(id2) }`);
          expect(id2 == 'my-key').assertTrue();
        }

        let text3 = await driver.findComponent(ON.id('my-', MatchPattern.STARTS_WITH));
        hilog.info(domain, tag, `testId_static text3, ${ JSON.stringify(text3) }`);
        expect(text3 != null).assertTrue();
        if (text3 != null) {
          let id3 = await text3.getId();
          hilog.info(domain, tag, `testId_static id3 , ${ JSON.stringify(id3) }`);
          expect(id3 == 'my-key').assertTrue();
        }

        let text4 = await driver.findComponent(ON.id('-key', MatchPattern.ENDS_WITH));
        hilog.info(domain, tag, `testId_static text4, ${ JSON.stringify(text4) }`);
        expect(text4 != null).assertTrue();
        if (text4 != null) {
          let id4 = await text4.getId();
          hilog.info(domain, tag, `testId_static id4 , ${ JSON.stringify(id4) }`);
          expect(id4 == 'my-key').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testId_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testId_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testGetHint_static
     * @tc.number uitestOnTest_0003
     * @tc.desc   find button component by Regular Expression, and get Hint of the component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetHint_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testGetHint Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.hint('welcome', MatchPattern.REG_EXP));
        if (text == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.REG_EXP))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text, ${ JSON.stringify(text) }`);
        expect(text != null).assertTrue();
        if (text != null) {
          let hint = await text.getHint();
          hilog.info(domain, tag, `testGetHint_static hint is, ${ hint }`);
          expect(hint == 'welcome').assertTrue();
        }
        let text1 = await driver.findComponent(ON.hint('welcome', MatchPattern.REG_EXP_ICASE));
        if (text1 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text1 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.REG_EXP_ICASE))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text1, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue();
        if (text1 != null) {
          let hint1 = await text1.getHint();
          hilog.info(domain, tag, `testGetHint_static hint1 is, ${ hint1 }`);
          expect(hint1 == 'welcome').assertTrue();
        }
        let text2 = await driver.findComponent(ON.hint('welcome', MatchPattern.ENDS_WITH));
        if (text2 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text2 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.ENDS_WITH))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text2, ${ JSON.stringify(text2) }`);
        expect(text2 != null).assertTrue();
        if (text2 != null) {
          let hint2 = await text2.getHint();
          hilog.info(domain, tag, `testGetHint_static hint2 is, ${ hint2 }`);
          expect(hint2 == 'welcome').assertTrue();
        }

        let text3 = await driver.findComponent(ON.hint('welcome', MatchPattern.STARTS_WITH));
        if (text3 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text3 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.STARTS_WITH))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text3, ${ JSON.stringify(text3) }`);
        expect(text3 != null).assertTrue();
        if (text3 != null) {
          let hint3 = await text3.getHint();
          hilog.info(domain, tag, `testGetHint_static hint3 is, ${ hint3 }`);
          expect(hint3 == 'welcome').assertTrue();
        }

        let text4 = await driver.findComponent(ON.hint('welcome', MatchPattern.CONTAINS));
        if (text4 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text4 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.CONTAINS))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text4, ${ JSON.stringify(text4) }`);
        expect(text4 != null).assertTrue();
        if (text4 != null) {
          let hint4 = await text4.getHint();
          hilog.info(domain, tag, `testGetHint_static hint4 is, ${ hint4 }`);
          expect(hint4 == 'welcome').assertTrue();
        }

        let text5 = await driver.findComponent(ON.hint('welcome', MatchPattern.EQUALS));
        if (text5 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text5 = await scroll.scrollSearch(ON.hint('welcome', MatchPattern.EQUALS))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text5, ${ JSON.stringify(text5) }`);
        expect(text5 != null).assertTrue();
        if (text5 != null) {
          let hint5 = await text5.getHint();
          hilog.info(domain, tag, `testGetHint_static hint5 is, ${ hint5 }`);
          expect(hint5 == 'welcome').assertTrue();
        }

        let text6 = await driver.findComponent(ON.hint('welcome'));
        if (text6 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            text6 = await scroll.scrollSearch(ON.hint('welcome'))
          }
        }
        hilog.info(domain, tag, `testGetHint_static text6, ${ JSON.stringify(text6) }`);
        expect(text6 != null).assertTrue();
        if (text6 != null) {
          let hint6 = await text6.getHint();
          hilog.info(domain, tag, `testGetHint_static hint6 is, ${ hint6 }`);
          expect(hint6 == 'welcome').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testGetHint_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testGetHint_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testDescription_static
     * @tc.number uitestOnTest_0004
     * @tc.desc   find UiComponent by description attribute and get it's description attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDescription_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDescription_static Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let text = await driver.findComponent(ON.type('Text').description('', MatchPattern.EQUALS));
        expect(text != null).assertTrue();
        if (text != null) {
          let description = await text.getDescription();
          hilog.info(domain, tag, `testDescription_static description, ${ JSON.stringify(description) }`);
          expect(description == '').assertTrue();
        }

        let text1 = await driver.findComponent(ON.type('Text').description(''));
        hilog.info(domain, tag, `testDescription_static  text1, ${ JSON.stringify(text1) }`);
        expect(text1 != null).assertTrue();
        if (text1 != null) {
          let description1 = await text1.getDescription();
          hilog.info(domain, tag, `testDescription_static description1, ${ JSON.stringify(description1) }`);
          expect(description1 == '').assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testDescription_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testDescription_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testWithIn_static
     * @tc.number uitestOnTest_0005
     * @tc.desc   find UiComponent inside of the given UiComponent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWithIn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testWithIn_static Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let btn = await driver.findComponent(ON.within(ON.type('Scroll')).text('next page'))
        hilog.info(domain, tag, `testWithIn_static btn, ${ JSON.stringify(btn) }`);
        expect(btn != null).assertTrue();
        if (btn != null) {
          let text = await btn.getText();
          hilog.info(domain, tag, `testWithIn_static text, ${ JSON.stringify(text) }`);
          expect(text).assertEqual('next page');
        }
      } catch(error) {
        hilog.info(domain, tag, `testWithIn_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testWithIn_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testScrollable_static
     * @tc.number uitestOnTest_0006
     * @tc.desc   find UiComponent by scrollable attribute and get it's scrollable attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScrollable_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testScrollable_static Start!!!!!`);
      try {
        let driver = Driver.create()
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll').scrollable(false));
        hilog.info(domain, tag, `testScrollable_static scrollBar, ${ JSON.stringify(scrollBar) }`);
        expect(scrollBar == null).assertTrue();
        let scrollBar1 = await driver.findComponent(ON.type('Scroll').scrollable(true));
        hilog.info(domain, tag, `testScrollable_static scrollBar1, ${ JSON.stringify(scrollBar1) }`);
        expect(scrollBar1 != null).assertTrue();
        if (scrollBar1 != null) {
          let scrollable1 = await scrollBar1.isScrollable();
          hilog.info(domain, tag, `testScrollable_static scrollable1, ${ JSON.stringify(scrollable1) }`);
          expect(scrollable1).assertTrue();
        }
        let scrollBar2 = await driver.findComponent(ON.type('Scroll').scrollable());
        hilog.info(domain, tag, `testScrollable_static scrollBar2, ${ JSON.stringify(scrollBar2) }`);
        expect(scrollBar2 != null).assertTrue();
        if (scrollBar2 != null) {
          let scrollable2 = await scrollBar2.isScrollable();
          hilog.info(domain, tag, `testScrollable_static scrollable2, ${ JSON.stringify(scrollable2) }`);
          expect(scrollable2).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testScrollable_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testScrollable_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testCheckable_static
     * @tc.number uitestOnTest_0007
     * @tc.desc   find UiComponent by checkable attribute and get it's checkable attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCheckable_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testCheckable_static Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(1000);
        let button = await driver.findComponent(ON.checkable().type('Checkbox'));
        if (button == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            button = await scroll.scrollSearch(ON.checkable().type('Checkbox'))
          }
        }
        hilog.info(domain, tag, `testCheckable_static button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue();
        if (button != null) {
          let isCheckAble = await button.isCheckable();
          hilog.info(domain, tag, `testCheckable_static isCheckAble, ${ JSON.stringify(isCheckAble) }`);
          expect(isCheckAble).assertTrue();
        }
        let button1 = await driver.findComponent(ON.checkable(false).type('Checkbox'));
        hilog.info(domain, tag, `testCheckable_static button1, ${ JSON.stringify(button1) }`);
        expect(button1 == null).assertTrue();
        let button2 = await driver.findComponent(ON.checkable(true).type('Checkbox'));
        if (button2 == null) {
          let scroll = await driver.findComponent(ON.type('Scroll'))
          if (scroll != null) {
            button2 = await scroll.scrollSearch(ON.checkable(true).type('Checkbox'))
          }
        }
        hilog.info(domain, tag, `testCheckable_static button2, ${ JSON.stringify(button2) }`);
        expect(button2 != null).assertTrue();
        if (button2 != null ) {
          let isCheckable2 = await button2.isCheckable();
          hilog.info(domain, tag, `testCheckable_static isCheckable2, ${ JSON.stringify(isCheckable2) }`);
          expect(isCheckable2).assertTrue();
        }
      } catch(error) {
        hilog.info(domain, tag, `testCheckable_static error, ${ JSON.stringify(error) }`);
        expect().assertFail();
      }
      hilog.info(domain, tag, `testCheckable_static end!!!!!`);
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testMatchPattern_static
     * @tc.number uitestOnTest_0008
     * @tc.desc   specifies the string value match pattern.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMatchPattern_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, `testMatchPattern_static Start!!!!!`);
      try {
        let driver = Driver.create();
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
        await driver.delayMs(waitUiReadyMs);
        let button1 = await driver.findComponent(ON.text('next page',MatchPattern.EQUALS));
        hilog.info(domain, tag, `testMatchPattern_static bt1Text, ${ JSON.stringify(button1)}`);
        expect(button1 != null).assertTrue()
        if (button1 != null) {
          let bt1Text = await button1.getText();
          hilog.info(domain, tag, `testMatchPattern_static bt1Text, ${ JSON.stringify(bt1Text)}`);
          expect(bt1Text).assertEqual('next page');
        }

        let button2 = await driver.findComponent(ON.text('next',MatchPattern.STARTS_WITH));
        hilog.info(domain, tag, `testMatchPattern_static button2, ${ JSON.stringify(button2)}`);
        expect(button2 != null).assertTrue()
        if (button2 != null) {
          let bt2Text = await button2.getText();
          hilog.info(domain, tag, `testMatchPattern_static bt2Text, ${ JSON.stringify(bt2Text)}`);
          expect(bt2Text).assertEqual('next page');
        }
        let button3 = await driver.findComponent(ON.text('xt page',MatchPattern.ENDS_WITH));
        hilog.info(domain, tag, `testMatchPattern_static button3, ${ JSON.stringify(button3)}`);
        expect(button3 != null).assertTrue()
        if (button3 != null) {
          let bt3Text = await button3.getText();
          hilog.info(domain, tag, `testMatchPattern_static bt3Text, ${ JSON.stringify(bt3Text)}`);
          expect(bt3Text).assertEqual('next page');
        }
        let button4 = await driver.findComponent(ON.text('ext',MatchPattern.CONTAINS))
        hilog.info(domain, tag, `testMatchPattern_static button4, ${ JSON.stringify(button4)}`);
        expect(button4 != null).assertTrue()
        if (button4 != null) {
          let bt4Text = await button4.getText();
          hilog.info(domain, tag, `testMatchPattern_static bt4Text, ${ JSON.stringify(bt4Text)}`);
          expect(bt4Text).assertEqual('next page');
        }
      } catch(error) {
        hilog.info(domain, tag, `testMatchPattern_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testSelected_static
     * @tc.number uitestOnTest_0009
     * @tc.desc   find UiComponent by selected attribute and get it's selected attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelected_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      hilog.info(domain, tag, `testSelected_static Start!!!!!`);
      try {
        let button3 = await driver.findComponent(ON.text('next page').selected(false));
        hilog.info(domain, tag, `testSelected_static button1, ${ JSON.stringify(button3)}`);
        expect(button3 != null).assertTrue();
        if(button3 != null) {
          let selected3 = await button3.isSelected();
          hilog.info(domain, tag, `testSelected_static selected3, ${ JSON.stringify(selected3)}`);
          expect(selected3).assertFalse();
        }
        let button1 = await driver.findComponent(ON.text('next page').selected());
        hilog.info(domain, tag, `testSelected_static button1, ${ JSON.stringify(button1)}`);
        expect(button1 == null).assertTrue();
        let button2 = await driver.findComponent(ON.text('next page').selected(true));
        hilog.info(domain, tag, `testSelected_static button2, ${ JSON.stringify(button2) }`);
        expect(button2 == null).assertTrue();
      } catch(error) {
        hilog.info(domain, tag, `testSelected_static error, ${ JSON.stringify(error)}`);
        expect().assertFail();
      }
      hilog.info(domain, tag, "testSelected_static over!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testisBefore_static
     * @tc.number uitestOnTest_0010
     * @tc.desc   find uiComponent which is before another UiComponent that specified by given.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testisBefore_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, `testisBefore_static Start!!!!!`);
      try {
        let driver = Driver.create()
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(waitUiReadyMs)
        let button = await driver.findComponent(ON.isBefore(ON.text('next page')).type('Button'));
        hilog.info(domain, tag, `testisBefore_static button, ${ JSON.stringify(button) }`);
        expect(button != null).assertTrue();
        if (button != null) {
          let btnType = await button.getType();
          hilog.info(domain, tag, `testisBefore_static btnType, ${ JSON.stringify(btnType) }`);
          expect(btnType).assertEqual('Button');
        }
      } catch(error) {
        hilog.info(domain, tag, `testisBefore_static error, ${JSON.stringify(error) }`);
        expect().assertFail()
      }
      hilog.info(domain, tag, "testisBefore_static over!!!!!!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testisAfter_static
     * @tc.number uitestOnTest_0011
     * @tc.desc   find uiComponent which is after another UiComponent that specified by given.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testisAfter_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, `testisAfter_static Start!!!!!`);
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(waitUiReadyMs);
      let button = await driver.findComponent(ON.isAfter(ON.text('dialog')).type('Text'));
      hilog.info(domain, tag, `testisAfter_static button success, ${ JSON.stringify(button) }`);
      expect(button != null).assertTrue();
      if (button != null) {
        let btnText = await button.getText();
        hilog.info(domain, tag, `testisAfter_static btnText success, ${ JSON.stringify(btnText) }`);
        expect(btnText == 'next page').assertTrue()
      }
      hilog.info(domain, tag, "testisAfter_static over!!!!!!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testInWindow_static
     * @tc.number uitestOnTest_0012
     * @tc.desc   scroll the mouse wheel at the specified location to specify the cell.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async ():Promise<void> => {
      hilog.info(domain, tag, "testInWindow_static Start!!!!!")
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
      await driver.delayMs(waitUiReadyMs)
      let btn = await driver.findComponent(ON.inWindow('com.uitestScene.acts').text('next page'));
      hilog.info(domain, tag, `testInWindow_static button, ${ JSON.stringify(btn) }`);
      expect(btn != null).assertTrue();
      hilog.info(domain, tag, "testInWindow_static over!!!!!!!!!")
      await stopApplication('com.uitestScene.acts')
    })

    /**
     * @tc.name   testFocused_static
     * @tc.number uitestOnTest_0013
     * @tc.desc   find UiComponent by focused attribute and get it's focused attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFocused_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, "testFocused_static Start!!!!!");
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text('next page').focused(false));
      hilog.info(domain, tag, `testFocused_static button, ${ JSON.stringify(button) }`);
      expect(button != null).assertTrue();
      if (button != null) {
        let focused = await button.isFocused();
        hilog.info(domain, tag, `testFocused_static focused, ${ JSON.stringify(focused) }`);
        expect(focused).assertFalse();
      }

      let button1 = await driver.findComponent(ON.text('next page').focused());
      hilog.info(domain, tag, `testFocused_static button1, ${ JSON.stringify(button1) }`);
      expect(button1 == null).assertTrue();
      let button2 = await driver.findComponent(ON.text('next page').focused(true));
      hilog.info(domain, tag, `testFocused_static button2, ${ JSON.stringify(button2) }`);
      expect(button2 == null).assertTrue();
      hilog.info(domain, tag, "testFocused_static over!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testEnabled_static
     * @tc.number uitestOnTest_0014
     * @tc.desc   find UiComponent by enabled attribute and get it's enabled attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEnabled_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, "testEnabled_static Start!!!!!")
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text('next page').enabled());
      hilog.info(domain, tag, `testEnabled_static button, ${ JSON.stringify(button) }`);
      expect(button != null).assertTrue();
      if (button != null) {
        let enable = await button.isEnabled();
        hilog.info(domain, tag, `testEnabled_static enable, ${ JSON.stringify(enable) }`);
        expect(enable).assertTrue();
      }
      let button1 = await driver.findComponent(ON.text('next page').enabled(false));
      hilog.info(domain, tag, `testEnabled_static button1, ${ JSON.stringify(button1) }`);
      expect(button1 == null).assertTrue();
      let button2 = await driver.findComponent(ON.text('next page').enabled(true));
      hilog.info(domain, tag, `testEnabled_static button2, ${ JSON.stringify(button2) }`);
      expect(button2 != null).assertTrue();
      if (button2 != null) {
        let enable2 = await button2.isEnabled();
        hilog.info(domain, tag, `testEnabled_static enable2, ${ JSON.stringify(enable2) }`);
        expect(enable2).assertTrue();
      }
      hilog.info(domain, tag, "testEnabled_static over!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testClickable_static
     * @tc.number uitestOnTest_0015
     * @tc.desc   find UiComponent by clickable attribute and get it's clickable attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClickable_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, "testClickable_static Start!!!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text('next page').clickable());
      expect(button == null).assertTrue();
      hilog.info(domain, tag, `testClickable_static button, ${ JSON.stringify(button) }`);
      let button1 = await driver.findComponent(ON.text('next page').clickable(true));
      hilog.info(domain, tag, `testClickable_static button1 , ${ JSON.stringify(button1) }`);
      expect(button1 == null).assertTrue();
      let button2 = await driver.findComponent(ON.text('next page').clickable(false));
      hilog.info(domain, tag, `testClickable_static button2 , ${ JSON.stringify(button2) }`);
      expect(button2 != null).assertTrue();
      if (button2 != null) {
        let clickable2 = await button2.isClickable();
        hilog.info(domain, tag, `testClickable_static clickable2, ${ JSON.stringify(clickable2) }`);
        expect(!clickable2).assertTrue();
        let msg2 = await button2.getText();
        hilog.info(domain, tag, `testClickable_static msg2, ${ JSON.stringify(msg2) }`);
      }
      hilog.info(domain, tag, "testClickable_static over!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testChecked_static
     * @tc.number uitestOnTest_0016
     * @tc.desc   find UiComponent by checked attribute and get it's checked attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testChecked_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, "testChecked_static Start!!!!!");
      let driver = Driver.create();
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.type('Checkbox').checked(false));
      hilog.info(domain, tag, `testChecked_static button, ${ JSON.stringify(button) }`);
      expect(button != null).assertTrue();
      if (button != null) {
        let checked = await button.isChecked();
        hilog.info(domain, tag, `testChecked_static checked, ${ JSON.stringify(checked) }`);
        expect(!checked).assertTrue();
      }
      let button1 = await driver.findComponent(ON.type('Checkbox').checked(true));
      hilog.info(domain, tag, `testChecked_static button1, ${ JSON.stringify(button1) }`);
      expect(button1 != null).assertTrue();
      if (button1 != null) {
        let checked1 = await button1.isChecked();
        hilog.info(domain, tag, `testChecked_static checked1, ${ JSON.stringify(checked1) }`);
        expect(checked1).assertTrue();
      }
      let button2 = await driver.findComponent(ON.type('Checkbox').checked());
      hilog.info(domain, tag, `testChecked_static button2, ${ JSON.stringify(button2) }`);
      expect(button2 != null).assertTrue();
      if (button2 != null) {
        let checked2 = await button2.isChecked();
        hilog.info(domain, tag, `testChecked_static checked2, ${ JSON.stringify(checked2) }`);
        expect(checked2).assertTrue();
      }
      hilog.info(domain, tag, "testChecked_static over!!!!!!!!!");
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name   testLongClickable_static
     * @tc.number uitestOnTest_0017
     * @tc.desc   find UiComponent by longClickable attribute and get it's longClickable attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLongClickable_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async ():Promise<void> => {
      hilog.info(domain, tag, "testLongClickable_static Start!!!!!");
      let driver = Driver.create()
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver.delayMs(1000);
      let button = await driver.findComponent(ON.text('next page').longClickable(true));
      hilog.info(domain, tag, `testLongClickable_static button, ${ JSON.stringify(button) }`);
      expect(button == null).assertTrue();
      let button1 = await driver.findComponent(ON.text('next page').longClickable());
      hilog.info(domain, tag, `testLongClickable_static button1, ${ JSON.stringify(button1) }`);
      expect(button1 == null).assertTrue();
      let button2 = await driver.findComponent(ON.text('next page').longClickable(false));
      hilog.info(domain, tag, `testLongClickable_static button2, ${ JSON.stringify(button2) }`);
      expect(button2 != null).assertTrue();
      if (button2 != null) {
        let longClickable2 = await button2.isLongClickable();
        hilog.info(domain, tag, `testLongClickable_static longClickable2, ${ JSON.stringify(longClickable2) }`);
        expect(longClickable2).assertFalse();
        let msg2 =  await button2.getText();
        hilog.info(domain, tag, `testLongClickable_static msg2, ${ JSON.stringify(msg2) }`);
      }
      hilog.info(domain, tag, "testLongClickable_static end !!!!!");
      await stopApplication('com.uitestScene.acts');
    })
  })
}