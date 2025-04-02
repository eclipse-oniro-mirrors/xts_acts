/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import getLaunchWantForBundle from './GetLaunchWantForBundle.test.ets';
import getabilityInfo from './GetabilityInfo.test.ets';
import getApplicationInfoJsunit from './getApplicationInfoJsunit.test.ets';
import getAllAppInfoJsunit from './getAllApplicationInfoJsunit.test.ets';
import getAppCloneIdentity from "./getAppCloneIdentity.test.ets";
import getAbilityLabelJsUnit from "./GetAbilityLabelJsUnit.test.ets";
import isAbilityEnableETSUnit from "./IsAbilityEnabledETSUnit.ets";
import isApplicationEnabledETSUnit from "./IsApplicationEnabledETSUnit.ets";
import getAbilityIcon from "./GetAbilityIcon.test.ets";
import getNameForUid from "./GetNameForUid.test.ets";
import getBundleArchiveInfo from "./getBundleArchiveInfo.test.ets";
import getQueryAbilityByWant from './GetQueryAbilityByWant.test.ets';
import getBundleInfoForSelf from './GetBundleInfoForSelf.test.ets';
import getLaunchWant from './GetLaunchWant.test.ets';

export default function testsuite() {
  getBundleInfoForSelf();
  getAbilityIcon();
  getLaunchWantForBundle();
  getNameForUid();
  getQueryAbilityByWant();
  getApplicationInfoJsunit();
  getAllAppInfoJsunit();
  getabilityInfo();
  getAbilityLabelJsUnit();
  isAbilityEnableETSUnit();
  isApplicationEnabledETSUnit();
  getBundleArchiveInfo();
  getLaunchWant();
  getAppCloneIdentity();
}