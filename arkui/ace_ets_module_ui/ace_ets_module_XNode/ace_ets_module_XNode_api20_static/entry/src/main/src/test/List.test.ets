'use static';
/*
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

import IsAvailableTest from './ContextTest/IsAvailableTest.test';
import AttributeUpdaterAttribute from './AttributeUpdaterAttribute/AttributeUpdaterAttribute.test';
import AttributeUpdaterUpdateConstructorParams from './AttributeUpdaterUpdateConstructorParams/AttributeUpdaterUpdateConstructorParams.test';
import FrameNodeAdoptChild from './FrameNode/FrameNodeAdoptChild.test';
import FrameNodeGestureEvent from './FrameNode/FrameNodeGestureEvent.test';
import FrameNodeCommonAttribute from './FrameNode/FrameNodeCommonAttribute.test';
import FrameNodeRemoveAdoptedChild from './FrameNode/FrameNodeRemoveAdoptedChild.test';
import FrameNodeCreateAnimation from './FrameNode/FrameNodeCreateAnimation.test';
import FrameNodeCancelAnimations from './FrameNode/FrameNodeCancelAnimations.test';
import FrameNodeGetNodePropertyValue from './FrameNode/FrameNodeGetNodePropertyValue.test';
import FrameNodeConvertPosition from './FrameNode/FrameNodeConvertPosition.test';
import FrameNodeConvertPositionFromWindow from './FrameNode/FrameNodeConvertPositionFromWindow.test';
import FrameNodeConvertPositionToWindow from './FrameNode/FrameNodeConvertPositionToWindow.test';
import FrameNodeInvalidateAttributes from './FrameNode/FrameNodeInvalidateAttributes.test';
import FrameNodeIsInRenderState from './FrameNode/FrameNodeIsInRenderState.test';
import FrameNodeIsOnMainTree from './FrameNode/FrameNodeIsOnMainTree.test';
import FrameNodeCreateButtonNode from './FrameNode/FrameNodeCreateButtonNode.test';
import FrameNodeCreateCheckboxGroupNode from './FrameNode/FrameNodeCreateCheckboxGroupNode.test';
import FrameNodeCreateCheckboxNode from './FrameNode/FrameNodeCreateCheckboxNode.test';
import FrameNodeCreateColumnNode from './FrameNode/FrameNodeCreateColumnNode.test';
import FrameNodeCreateFlexNode from './FrameNode/FrameNodeCreateFlexNode.test';
import FrameNodeCreateGridItemNode from './FrameNode/FrameNodeCreateGridItemNode.test';
import FrameNodeCreateGridNode from './FrameNode/FrameNodeCreateGridNode.test';
import FrameNodeCreateImageNode from './FrameNode/FrameNodeCreateImageNode.test';
import FrameNodeCreateListItemGroupNode from './FrameNode/FrameNodeCreateListItemGroupNode.test';
import FrameNodeCreateListItemNode from './FrameNode/FrameNodeCreateListItemNode.test';
import FrameNodeCreateListNode from './FrameNode/FrameNodeCreateListNode.test';
import FrameNodeCreateLoadingProgressNode from './FrameNode/FrameNodeCreateLoadingProgressNode.test';
import FrameNodeCreateProgressNode from './FrameNode/FrameNodeCreateProgressNode.test';
import FrameNodeCreateRadioNode from './FrameNode/FrameNodeCreateRadioNode.test';
import FrameNodeCreateRelativeContainerNode from './FrameNode/FrameNodeCreateRelativeContainerNode.test';
import FrameNodeCreateRowNode from './FrameNode/FrameNodeCreateRowNode.test';
import FrameNodeCreateScrollNode from './FrameNode/FrameNodeCreateScrollNode.test';
import FrameNodeCreateSliderNode from './FrameNode/FrameNodeCreateSliderNode.test';
import FrameNodecreateStackNode from './FrameNode/FrameNodecreateStackNode.test';
import FrameNodeCreateSwiperNode from './FrameNode/FrameNodeCreateSwiperNode.test';
import FrameNodeCreateTextAreaNode from './FrameNode/FrameNodeCreateTextAreaNode.test';
import FrameNodeCreateTextInputNode from './FrameNode/FrameNodeCreateTextInputNode.test';
import FrameNodeCreateTextNode from './FrameNode/FrameNodeCreateTextNode.test';
import FrameNodeCreateToggleNode from './FrameNode/FrameNodeCreateToggleNode.test';
import FrameNodeCreateWaterFlowNode from './FrameNode/FrameNodeCreateWaterFlowNode.test';
import FrameNodeCreateFlowItemNode from './FrameNode/FrameNodeCreateFlowItemNode.test';
import FrameNodeConstructor from './FrameNode/FrameNodeConstructor.test';
import CrossLanguageOptionsSupportFiveMethodsStaticTest from './FrameNode/CrossLanguageOptionsSupportFiveMethodsStaticTest.test';
import RenderNodeBlurStaticTest from './RenderNode/RenderNodeBlurStaticTest.test';

export default function testsuite() {
    //IsAvailableTest();
    AttributeUpdaterAttribute();
    AttributeUpdaterUpdateConstructorParams();
    FrameNodeAdoptChild();
    FrameNodeGestureEvent();
    FrameNodeCommonAttribute();
    FrameNodeRemoveAdoptedChild();
    FrameNodeCreateAnimation();
    FrameNodeCancelAnimations();
    FrameNodeGetNodePropertyValue();
    FrameNodeConvertPosition();
    FrameNodeConvertPositionFromWindow();
    FrameNodeConvertPositionToWindow();
    FrameNodeInvalidateAttributes();
    FrameNodeIsInRenderState();
    FrameNodeIsOnMainTree();
    FrameNodeCreateButtonNode();
    FrameNodeCreateCheckboxGroupNode();
    FrameNodeCreateCheckboxNode();
    FrameNodeCreateColumnNode();
    FrameNodeCreateFlexNode();
    FrameNodeCreateGridItemNode();
    FrameNodeCreateGridNode();
    FrameNodeCreateImageNode();
    FrameNodeCreateListItemGroupNode();
    FrameNodeCreateListItemNode();
    FrameNodeCreateListNode();
    FrameNodeCreateLoadingProgressNode();
    FrameNodeCreateProgressNode();
    FrameNodeCreateRadioNode();
    FrameNodeCreateRelativeContainerNode();
    FrameNodeCreateRowNode();
    FrameNodeCreateScrollNode();
    FrameNodeCreateSliderNode();
    FrameNodecreateStackNode();
    FrameNodeCreateSwiperNode();
    FrameNodeCreateTextAreaNode();
    FrameNodeCreateTextInputNode();
    FrameNodeCreateTextNode();
    FrameNodeCreateToggleNode();
    FrameNodeCreateWaterFlowNode();
    FrameNodeCreateFlowItemNode();
    FrameNodeConstructor();
    CrossLanguageOptionsSupportFiveMethodsStaticTest();
    RenderNodeBlurStaticTest();
}