/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import staticExport from './Export.test';
import staticLoadHap from './Hap.test';
import staticLoadSourceHar from './SourceHar.test';
import staticLoadHsp from './Hsp.test';
import staticLoadRemoteHar from './RemoteHar.test';

export default function testsuite() {
  staticLoadHap();
  staticLoadSourceHar();
  staticLoadRemoteHar();
  staticLoadHsp();
  staticExport();
}