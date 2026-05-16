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
import enableJsunit from './enabledTest/EnableJsunit.test';
import monopolizeTest from './TouchInteractionControl/monopolizeEventsTest/monopolizeTest.test';
import responseRegionListTest from "./responseRegion/responseRegionList.test";
import componentUtilsTest from './componentUtils/ComponentUtilsTest.test';
import backgroundImageNullAndUndefinedTest from './BackgroundImage/backgroundImageNullAndUndefinedTest.test';
import monopolizeEventsNullAndUndefinedTest from './MonopolizeEvents/monopolizeEventsNullAndUndefinedTest.test';
import obscuredNullAndUndefinedTest from './Obscured/obscuredNullAndUndefinedTest.test';
import overlayNullAndUndefinedTest from './Overlay/overlayNullAndUndefinedTest.test';
import restoreIdNullAndUndefinedTest from './RestoreId/restoreIdNullAndUndefinedTest.test';
import zIndexNullAndUndefinedTest from './ZIndex/zIndexNullAndUndefinedTest.test';
import commonMethodBackgroundImageNullAndUndefinedTest
    from './CommonMethod/commonMethodBackgroundImageNullAndUndefinedTest.test';
import commonMethodBackgroundImageSizeNullAndUndefinedTest
    from './CommonMethod/commonMethodBackgroundImageSizeNullAndUndefinedTest.test';
import commonMethodBackgroundNullAndUndefinedTest from './CommonMethod/commonMethodBackgroundNullAndUndefinedTest.test';
import commonMethodHitTestBehaviorNullAndUndefinedTest
    from './CommonMethod/commonMethodHitTestBehaviorNullAndUndefinedTest.test';
import commonMethodMouseResponseRegionNullAndUndefinedTest
    from './CommonMethod/commonMethodMouseResponseRegionNullAndUndefinedTest.test';
import commonMethodResponseRegionListNullAndUndefinedTest
    from './CommonMethod/commonMethodResponseRegionListNullAndUndefinedTest.test';
import commonMethodResponseRegionNullAndUndefinedTest
    from './CommonMethod/commonMethodResponseRegionNullAndUndefinedTest.test';
import backgroundColorCreateHDRColorTest from './ColorMetrics/backgroundColorCreateHDRColorTest.test';
import createHDRColorWithLogExposureTest from './ColorMetrics/createHDRColorWithLogExposure.test';
import createHDRColorWithLinearExposureTest from './ColorMetrics/createHDRColorWithLinearExposure.test';

export default function testsuite() {
    enableJsunit();
    monopolizeTest();
    responseRegionListTest();
    componentUtilsTest();
    backgroundImageNullAndUndefinedTest();
    monopolizeEventsNullAndUndefinedTest();
    obscuredNullAndUndefinedTest();
    overlayNullAndUndefinedTest();
    restoreIdNullAndUndefinedTest();
    zIndexNullAndUndefinedTest();
    commonMethodBackgroundImageNullAndUndefinedTest();
    commonMethodBackgroundImageSizeNullAndUndefinedTest();
    commonMethodBackgroundNullAndUndefinedTest();
    commonMethodHitTestBehaviorNullAndUndefinedTest();
    commonMethodMouseResponseRegionNullAndUndefinedTest();
    commonMethodResponseRegionListNullAndUndefinedTest();
    commonMethodResponseRegionNullAndUndefinedTest();
    backgroundColorCreateHDRColorTest();
    createHDRColorWithLogExposureTest();
    createHDRColorWithLinearExposureTest();
}