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

import getDragController from './UIContext/getDragController.test';
import dragAdaptationTest from './DragController/dragAdaptationTest.test';
import touchPoint from './DragController/touchPoint_Auto.test';
import previewOptions from './DragController/touchPoint_Disable.test';
import createDragAction from './DragController/createDragAction.test';
import setForegroundColor from './DragController/setForegroundColor.test';
import DragActionJsunit from './DragController/DragActionJsSuit.test';
import dragPreviewJsSuit from './DragController/dragPreviewJsSuit.test';
import dragPreviewOptionsJsSuit from './DragController/dragPreviewOptionsJsSuit.test';
import APIPreDragStatusTest from './DragController/APIPreDragStatusTest.test';
import DragInteractionOptionsTest from './DragController/DragInteractionOptions.test';
import DragPreviewOptions from './DragPreviewOptions/DragPreviewOptions.test';
import dataLoadingTest from './startDataLoading/dataLoadingTest.test';
import PreDrag from './Drag/PreDrag.test';
import enableEdgeAutoScroll_false from './DragInteractionOptions/enableEdgeAutoScroll_false.test';
import enableEdgeAutoScroll_true from './DragInteractionOptions/enableEdgeAutoScroll_true.test';
import enableEdgeAutoScroll from './DragInteractionOptions/enableEdgeAutoScroll.test';
import notifyDragStartRequest from './Drag/notifyDragStartRequest.test';
import DragEventUITest from "./DragController/DragEventUI.test";
import dragActionAndPreviewTest from "./DragController/DragActionAndPreviewNullandundefined/DragActionAndPreviewTest.test";
import createDragActionAndSpringTest from "./DragController/CreateDragActionAndSpringNullandundefined/CreateDragActionAndSpringTest.test";
import dragControllerTest from './UIContext/DragControllerNullandundefined/DragControllerTest.test';
import onDragSpringLoadingNullAndUndefinedTest from './OnDragSpringLoading/onDragSpringLoadingNullAndUndefinedTest.test';
import dragPreviewOptionsNullAndUndefinedTest from './DragPreviewOptions/dragPreviewOptionsNullAndUndefinedTest.test';
import dragPreviewNullAndUndefinedTest from './DragPreview/dragPreviewNullAndUndefinedTest.test';
import dragEventNullAndUndefinedTest from './DragEvent/dragEventNullAndUndefinedTest.test';
import onMoveNullAndUndefinedTest from './OnMove/onMoveNullAndUndefinedTest.test';
import onMoveV20NullAndUndefinedTest from './OnMoveV20/onMoveV20NullAndUndefinedTest.test';
import allowDropNullAndUndefinedTest from './AllowDrop/allowDropNullAndUndefinedTest.test';
import setDataLoadParamsNullAndUndefinedTest from './DragEvent/setDataLoadParamsNullAndUndefinedTest.test';
import setDataNullAndUndefinedTest from './DragEvent/setDataNullAndUndefinedTest.test';
import startDataLoadingNullAndUndefinedTest from './DragEvent/startDataLoadingNullAndUndefinedTest.test';

export default function testsuite() {
    dragAdaptationTest();
    DragEventUITest();
    getDragController();
    PreDrag();
    enableEdgeAutoScroll_false();
    enableEdgeAutoScroll_true();
    enableEdgeAutoScroll();
    notifyDragStartRequest()
    touchPoint();
    previewOptions();
    // createDragAction()
    // setForegroundColor()
    DragActionJsunit();
    dragPreviewJsSuit();
    dragPreviewOptionsJsSuit();
    APIPreDragStatusTest();
    DragInteractionOptionsTest();
    DragPreviewOptions();
    dragActionAndPreviewTest();
    createDragActionAndSpringTest();
    dragControllerTest();
    onDragSpringLoadingNullAndUndefinedTest();
    dragPreviewOptionsNullAndUndefinedTest();
    dragPreviewNullAndUndefinedTest();
    dragEventNullAndUndefinedTest();
    onMoveNullAndUndefinedTest();
    onMoveV20NullAndUndefinedTest();
    allowDropNullAndUndefinedTest();
    setDataLoadParamsNullAndUndefinedTest();
    setDataNullAndUndefinedTest();
    startDataLoadingNullAndUndefinedTest();
}