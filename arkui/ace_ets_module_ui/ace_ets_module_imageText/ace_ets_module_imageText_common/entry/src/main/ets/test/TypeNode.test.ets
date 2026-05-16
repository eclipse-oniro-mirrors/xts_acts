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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { FrameNode, NodeController, typeNode, UIContext } from '@kit.ArkUI';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function TypeNodeTest() {
  describe('TypeNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TypeNodeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TypeNodeTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TypeNodeTest state pages: " + JSON.stringify(pages));
        if (!("TypeNodeTestPage" == pages.name)) {
          console.info("get TypeNodeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TypeNodeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TypeNodeTest page error: " + err);
      }
      done();
    });

    let uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!

    /**
     * @tc.name   Text_createNode_context_null
     * @tc.number Text_createNode_context_null
     * @tc.desc   测试 Text createNode 属性参数 context为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_createNode_context_null', Level.LEVEL2, () => {
      try {
        let textNode = typeNode.createNode(null, 'Text');
        expect(textNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   Text_createNode_context_undefined
     * @tc.number Text_createNode_context_undefined
     * @tc.desc   测试 Text createNode 属性参数 context为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_createNode_context_undefined', Level.LEVEL2, () => {
      try {
        let textNode = typeNode.createNode(undefined, 'Text');
        expect(textNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   Progress_createNode_context_null
     * @tc.number Progress_createNode_context_null
     * @tc.desc   测试 Progress createNode 属性参数 context为 NULL 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Progress_createNode_context_null', Level.LEVEL2, () => {
      try {
        let progressNode = typeNode.createNode(null, 'Progress');
        expect(progressNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   Progress_createNode_context_undefined
     * @tc.number Progress_createNode_context_undefined
     * @tc.desc   测试 Progress createNode 属性参数 context为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Progress_createNode_context_undefined', Level.LEVEL2, () => {
      try {
        let progressNode = typeNode.createNode(undefined, 'Progress');
        expect(progressNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   LoadingProgress_createNode_context_null
     * @tc.number LoadingProgress_createNode_context_null
     * @tc.desc   测试 LoadingProgress createNode 属性参数 context为 NULL 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LoadingProgress_createNode_context_null', Level.LEVEL2, () => {
      try {
        let loadingProgressNode = typeNode.createNode(null, 'LoadingProgress');
        expect(loadingProgressNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   LoadingProgress_createNode_context_undefined
     * @tc.number LoadingProgress_createNode_context_undefined
     * @tc.desc   测试 LoadingProgress createNode 属性参数 context为 UNDEFINED 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LoadingProgress_createNode_context_undefined', Level.LEVEL2, () => {
      try {
        let loadingProgressNode = typeNode.createNode(undefined, 'LoadingProgress');
        expect(loadingProgressNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextInput_createNode_context_null
     * @tc.number TextInput_createNode_context_null
     * @tc.desc   测试 TextInput createNode 属性参数 context为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_createNode_context_null', Level.LEVEL2, () => {
      try {
        let textInputNode = typeNode.createNode(null, 'TextInput');
        expect(textInputNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextInput_createNode_context_undefined
     * @tc.number TextInput_createNode_context_undefined
     * @tc.desc   测试 TextInput createNode 属性参数 context为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_createNode_context_undefined', Level.LEVEL2, () => {
      try {
        let textInputNode = typeNode.createNode(undefined, 'TextInput');
        expect(textInputNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextArea_createNode_context_null
     * @tc.number TextArea_createNode_context_null
     * @tc.desc   测试 TextArea createNode 属性参数 context为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_createNode_context_null', Level.LEVEL2, () => {
      try {
        let textAreaNode = typeNode.createNode(null, 'TextArea');
        expect(textAreaNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextArea_createNode_context_undefined
     * @tc.number TextArea_createNode_context_undefined
     * @tc.desc   测试 TextArea createNode 属性参数 context为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_createNode_context_undefined', Level.LEVEL2, () => {
      try {
        let textAreaNode = typeNode.createNode(undefined, 'TextArea');
        expect(textAreaNode).assertNull();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   Text_getAttribute_node_null
     * @tc.number Text_getAttribute_node_null
     * @tc.desc   测试 Text getAttribute 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_getAttribute_node_null', Level.LEVEL2, () => {
      let textAttribute = typeNode.getAttribute(null, 'Text');
      expect(textAttribute).assertUndefined();
    });

    /**
     * @tc.name   Text_getAttribute_node_undefined
     * @tc.number Text_getAttribute_node_undefined
     * @tc.desc   测试 Text getAttribute 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_getAttribute_node_undefined', Level.LEVEL2, () => {
      let textAttribute = typeNode.getAttribute(undefined, 'Text');
      expect(textAttribute).assertUndefined();
    });

    /**
     * @tc.name   Progress_getAttribute_node_null
     * @tc.number Progress_getAttribute_node_null
     * @tc.desc   测试 Progress getAttribute 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Progress_getAttribute_node_null', Level.LEVEL2, () => {
      let progressAttribute = typeNode.getAttribute(null, 'Progress');
      expect(progressAttribute).assertUndefined();
    });

    /**
     * @tc.name   Progress_getAttribute_node_undefined
     * @tc.number Progress_getAttribute_node_undefined
     * @tc.desc   测试 Progress getAttribute 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Progress_getAttribute_node_undefined', Level.LEVEL2, () => {
      let progressAttribute = typeNode.getAttribute(undefined, 'Progress');
      expect(progressAttribute).assertUndefined();
    });

    /**
     * @tc.name   LoadingProgress_getAttribute_node_null
     * @tc.number LoadingProgress_getAttribute_node_null
     * @tc.desc   测试 LoadingProgress getAttribute 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LoadingProgress_getAttribute_node_null', Level.LEVEL2, () => {
      let loadingProgressAttribute = typeNode.getAttribute(null, 'LoadingProgress');
      expect(loadingProgressAttribute).assertUndefined();
    });

    /**
     * @tc.name   LoadingProgress_getAttribute_node_undefined
     * @tc.number LoadingProgress_getAttribute_node_undefined
     * @tc.desc   测试 LoadingProgress getAttribute 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LoadingProgress_getAttribute_node_undefined', Level.LEVEL2, () => {
      let loadingProgressAttribute = typeNode.getAttribute(undefined, 'LoadingProgress');
      expect(loadingProgressAttribute).assertUndefined();
    });

    /**
     * @tc.name   TextInput_getAttribute_node_null
     * @tc.number TextInput_getAttribute_node_null
     * @tc.desc   测试 TextInput getAttribute 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_getAttribute_node_null', Level.LEVEL2, () => {
      let textInputAttribute = typeNode.getAttribute(null, 'TextInput');
      expect(textInputAttribute).assertUndefined();
    });

    /**
     * @tc.name   TextInput_getAttribute_node_undefined
     * @tc.number TextInput_getAttribute_node_undefined
     * @tc.desc   测试 TextInput getAttribute 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_getAttribute_node_undefined', Level.LEVEL2, () => {
      let textInputAttribute = typeNode.getAttribute(undefined, 'TextInput');
      expect(textInputAttribute).assertUndefined();
    });

    /**
     * @tc.name   TextArea_getAttribute_node_null
     * @tc.number TextArea_getAttribute_node_null
     * @tc.desc   测试 TextArea getAttribute 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_getAttribute_node_null', Level.LEVEL2, () => {
      let textAreaAttribute = typeNode.getAttribute(null, 'TextArea');
      expect(textAreaAttribute).assertUndefined();
    });

    /**
     * @tc.name   TextArea_getAttribute_node_undefined
     * @tc.number TextArea_getAttribute_node_undefined
     * @tc.desc   测试 TextArea getAttribute 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_getAttribute_node_undefined', Level.LEVEL2, () => {
      let textAreaAttribute = typeNode.getAttribute(undefined, 'TextArea');
      expect(textAreaAttribute).assertUndefined();
    });

    /**
     * @tc.name   Text_bindController_node_null
     * @tc.number Text_bindController_node_null
     * @tc.desc   测试 Text bindController 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_bindController_node_null', Level.LEVEL2, () => {
      try {
        let controller:TextController = new TextController();
        typeNode.bindController(null, controller, 'Text');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   Text_bindController_node_undefined
     * @tc.number Text_bindController_node_undefined
     * @tc.desc   测试 Text bindController 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_bindController_node_undefined', Level.LEVEL2, () => {
      try {
        let controller:TextController = new TextController();
        typeNode.bindController(undefined, controller, 'Text');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   Text_bindController_controller_null
     * @tc.number Text_bindController_controller_null
     * @tc.desc   测试 Text bindController 属性参数 controller为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_bindController_controller_null', Level.LEVEL2, () => {
      try {
        let node = new FrameNode(uiContext);
        typeNode.bindController(node, null, 'Text');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   Text_bindController_controller_undefined
     * @tc.number Text_bindController_controller_undefined
     * @tc.desc   测试 Text bindController 属性参数 controller为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Text_bindController_controller_undefined', Level.LEVEL2, () => {
      try {
        let node = new FrameNode(uiContext);
        typeNode.bindController(node, undefined, 'Text');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextInput_bindController_node_null
     * @tc.number TextInput_bindController_node_null
     * @tc.desc   测试 TextInput bindController 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_bindController_node_null', Level.LEVEL2, () => {
      try {
        let controller:TextInputController = new TextInputController();
        typeNode.bindController(null, controller, 'TextInput');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextInput_bindController_node_undefined
     * @tc.number TextInput_bindController_node_undefined
     * @tc.desc   测试 TextInput bindController 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_bindController_node_undefined', Level.LEVEL2, () => {
      try {
        let controller:TextInputController = new TextInputController();
        typeNode.bindController(undefined, controller, 'TextInput');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextInput_bindController_controller_null
     * @tc.number TextInput_bindController_controller_null
     * @tc.desc   测试 TextInput bindController 属性参数 controller为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_bindController_controller_null', Level.LEVEL2, () => {
      try {
        let node = new FrameNode(uiContext);
        typeNode.bindController(node, null, 'TextInput');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextInput_bindController_controller_undefined
     * @tc.number TextInput_bindController_controller_undefined
     * @tc.desc   测试 TextInput bindController 属性参数 controller为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextInput_bindController_controller_undefined', Level.LEVEL2, () => {
      try {
        let node = new FrameNode(uiContext);
        typeNode.bindController(node, undefined, 'TextInput');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextArea_bindController_node_null
     * @tc.number TextArea_bindController_node_null
     * @tc.desc   测试 TextArea bindController 属性参数 node为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_bindController_node_null', Level.LEVEL2, () => {
      try {
        let controller:TextAreaController = new TextAreaController();
        typeNode.bindController(null, controller, 'TextArea');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextArea_bindController_node_undefined
     * @tc.number TextArea_bindController_node_undefined
     * @tc.desc   测试 TextArea bindController 属性参数 node为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_bindController_node_undefined', Level.LEVEL2, () => {
      try {
        let controller:TextAreaController = new TextAreaController();
        typeNode.bindController(undefined, controller, 'TextArea');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextArea_bindController_controller_null
     * @tc.number TextArea_bindController_controller_null
     * @tc.desc   测试 TextArea bindController 属性参数 controller为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_bindController_controller_null', Level.LEVEL2, () => {
      try {
        let node = new FrameNode(uiContext);
        typeNode.bindController(node, null, 'TextArea');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /**
     * @tc.name   TextArea_bindController_controller_undefined
     * @tc.number TextArea_bindController_controller_undefined
     * @tc.desc   测试 TextArea bindController 属性参数 controller为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextArea_bindController_controller_undefined', Level.LEVEL2, () => {
      try {
        let node = new FrameNode(uiContext);
        typeNode.bindController(node, undefined, 'TextArea');
        expect(false).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });
  });
}
