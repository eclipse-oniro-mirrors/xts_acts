'use static';
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
import notifyDragStartRequest from './Drag/notifyDragStartRequest.test';
import PreDrag from './Drag/PreDrag.test';
import enableEdgeAutoScroll from './DragInteractionOptions/enableEdgeAutoScroll.test';
import enableEdgeAutoScroll_false from './DragInteractionOptions/enableEdgeAutoScroll_false.test';
import enableEdgeAutoScroll_true from './DragInteractionOptions/enableEdgeAutoScroll_true.test';
import InteractionEventBindingInfoTest from './InteractionEventBindingInfo/InteractionEventBindingInfo.test';
import nextFocus from './nextFocus/nextFocus.test';
import nextFocus2 from './nextFocus2/nextFocus2.test';
import onVisiable from './onVisiable/onVisiable.test';
import panGestureDistanceTest from './PanGesture/panGestureDistance.test';

export default function testsuite() {
  onVisiable();
  PreDrag();
  enableEdgeAutoScroll_false();
  enableEdgeAutoScroll_true();

  notifyDragStartRequest();
  enableEdgeAutoScroll();
  // InteractionEventBindingInfoTest();
  nextFocus();
  nextFocus2(); 
  // panGestureDistanceTest();
}
