/*
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
import { castTempFormFuzzTest } from './CastTempFormFuzz.test.ets';
import { deleteFormFuzzTest } from './DeleteFormFuzz.test.ets';
import { disableFormsUpdateFuzzTest } from './DisableFormsUpdateFuzz.test.ets';
import { enableFormsUpdateFuzzTest } from './EnableFormsUpdateFuzz.test.ets';
import { getFormsInfoFuzzTest } from './GetFormsInfoFuzz.test.ets';
import { notifyInvisibleFormsFuzzTest } from './NotifyInvisibleFormsFuzz.test.ets';
import { notifyVisibleFormsFuzzTest } from './NotifyVisibleFormsFuzz.test.ets';
import { releaseFormFuzzTest } from './ReleaseFormFuzz.test.ets';
import { requestFormFuzzTest } from './RequestFormFuzz.test.ets';
import { setFormNextRefreshTimeFuzzTest } from './SetFormNextRefreshTimeFuzz.test.ets';
import { updateFormFuzzTest } from './UpdateFormFuzz.test.ets';

export default function testsuite() {
  // FMS_fuzzTest_deleteform
  deleteFormFuzzTest(`DeleteFormFuzzTest`, 0);

  // FMS_fuzzTest_releaseform
  releaseFormFuzzTest(`ReleaseFormFuzzTest`, 0);

  // FMS_fuzzTest_casttempform
  castTempFormFuzzTest(`CastTempFormFuzzTest`, 0);

  // FMS_fuzzTest_invisible
  notifyVisibleFormsFuzzTest(`NotifyVisibleFormsFuzzTest`, 0);

  // FMS_fuzzTest_visible
  notifyInvisibleFormsFuzzTest(`NotifyInvisibleFormsFuzzTest`, 0);

  // FMS_fuzzTest_requestform
  requestFormFuzzTest(`RequestFormFuzzTest`, 0);

  // FMS_fuzzTest_updateform
  updateFormFuzzTest(`UpdateFormFuzzTest`, 0);

  // FMS_fuzzTest_setnexttime
  setFormNextRefreshTimeFuzzTest(`SetFormNextRefreshTimeFuzzTest`, 0);

  // FMS_fuzzTest_enable
  enableFormsUpdateFuzzTest(`EnableFormsUpdateFuzzTest`, 0);

  // FMS_fuzzTest_disable
  disableFormsUpdateFuzzTest(`DisableFormsUpdateFuzzTest`, 0);

  // FMS_fuzzTest_getinfobundle
  // FMS_fuzzTest_getinfomodule
  getFormsInfoFuzzTest(`GetFormsInfoFuzzTest`, 0);
}
