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

import getWithUniqueId from './ComponentSnapshotByUniqueId/getWithUniqueId.test';
import componentSnapshot from './componentSnapshot/componentSnapshot.test';
import SnapshotOptions_region from './SnapshotOptions_region/SnapshotOptions_region.test';
import APIcomponentSnapshotGetSync from './componentSnapshot/APIcomponentSnapshotGetSync.test';
import APIUIContextGetSync from './componentSnapshot/APIUIContextGetSync.test';
import UIContextComponentSnapshot from './UIContext/UIContextComponentSnapshot.test';
import ComponentSnapshotSync from './componentSnapshot/componentSnapshotSync.test';
import createFromBuilderTest from "./componentSnapshotCreateFromBuilder/createFromBuilder.test";
import createFromBuilderCallbackTest from "./componentSnapshotCreateFromBuilder/createFromBuilderCallback.test";
import createFromComponent from "./componentSnapshotCreateFromBuilder/createFromComponent.test";
import errorCreateFromBuilderTest from "./componentSnapshotCreateFromBuilder/errorCreateFromBuilder.test";

export default function testsuite() {
  SnapshotOptions_region();
  getWithUniqueId();
  componentSnapshot();
  APIcomponentSnapshotGetSync();
  APIUIContextGetSync();
  UIContextComponentSnapshot();
  ComponentSnapshotSync();
  createFromBuilderCallbackTest();
  createFromBuilderTest();
  createFromComponent();
  errorCreateFromBuilderTest();
}