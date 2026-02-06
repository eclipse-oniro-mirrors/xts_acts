/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_LATTICE_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_LATTICE_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {
// Lattice related functions
int TestLatticeCreateNormal();
int TestLatticeCreateNull();
int TestLatticeCreateAbnormal();
int TestLatticeCreateEnumTraversal();
int TestLatticeCreateMultipleCalls();
int TestLatticeDestroyNormal();
int TestLatticeDestroyNull();
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_LATTICE_TEST_H
