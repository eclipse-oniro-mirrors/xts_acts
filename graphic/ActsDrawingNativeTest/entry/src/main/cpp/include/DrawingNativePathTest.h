/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#ifndef ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_PATH_TEST_H
#define ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_PATH_TEST_H

namespace OHOS {
namespace Rosen {
namespace Drawing {

// Path circle constants
constexpr float PATH_CIRCLE_X_200 = 200.0f;
constexpr float PATH_CIRCLE_Y_200 = 200.0f;
constexpr float PATH_CIRCLE_X_300 = 300.0f;
constexpr float PATH_CIRCLE_Y_300 = 300.0f;
constexpr float PATH_CIRCLE_X_600 = 600.0f;
constexpr float PATH_CIRCLE_X_700 = 700.0f;
constexpr float PATH_CIRCLE_RADIUS_100 = 100.0f;

// Path related functions
int TestPathCreateNormal();
int TestPathCopyNormal();
int TestPathCopyNull();
int TestPathCopyInputDestroyed();
int TestPathDestroyNormal();
int TestPathDestroyNull();
int TestPathMoveToNormal();
int TestPathMoveToNull();
int TestPathMoveToAbnormal();
int TestPathMoveToMaximal();
int TestPathLineToNormal();
int TestPathLineToNull();
int TestPathLineToAbnormal();
int TestPathLineToMaximal();
int TestPathArcToNormal();
int TestPathArcToNull();
int TestPathArcToAbnormal();
int TestPathArcToMaximal();
int TestPathQuadToNormal();
int TestPathQuadToNull();
int TestPathQuadToAbnormal();
int TestPathQuadToMaximal();
int TestPathConicToNormal();
int TestPathConicToNull();
int TestPathConicToAbnormal();
int TestPathConicToMaximal();
int TestPathCubicToNormal();
int TestPathCubicToNull();
int TestPathCubicToAbnormal();
int TestPathCubicToMaximal();
int TestPathRMoveToNormal();
int TestPathRMoveToNull();
int TestPathRMoveToAbnormal();
int TestPathRMoveToMaximal();
int TestPathRLineToNormal();
int TestPathRLineToNull();
int TestPathRLineToAbnormal();
int TestPathRLineToMaximal();
int TestPathRQuadToNormal();
int TestPathRQuadToNull();
int TestPathRQuadToAbnormal();
int TestPathRQuadToMaximal();
int TestPathRConicToNormal();
int TestPathRConicToNull();
int TestPathRConicToAbnormal();
int TestPathRConicToMaximal();
int TestPathRCubicToNormal();
int TestPathRCubicToNull();
int TestPathRCubicToAbnormal();
int TestPathRCubicToMaximal();
int TestPathAddRectNormal();
int TestPathAddRectNull();
int TestPathAddRectAbnormal();
int TestPathAddRectMaximal();
int TestPathAddRectWithInitialCornerNormal();
int TestPathAddRectWithInitialCornerNull();
int TestPathAddRectWithInitialCornerAbnormal();
int TestPathAddRectWithInitialCornerMaximal();
int TestPathAddRoundRectNormal();
int TestPathAddRoundRectNull();
int TestPathAddOvalWithInitialPointNormal();
int TestPathAddOvalWithInitialPointNull();
int TestPathAddOvalWithInitialPointAbnormal();
int TestPathAddOvalWithInitialPointMaximal();
// Path Part2 Add related functions
int TestPathAddArcNormal();
int TestPathAddArcNull();
int TestPathAddArcAbnormal();
int TestPathAddArcMaximal();
int TestPathAddPathNormal();
int TestPathAddPathNull();
int TestPathAddPathWithMatrixAndModeNormal();
int TestPathAddPathWithMatrixAndModeNull();
int TestPathAddPathWithModeNormal();
int TestPathAddPathWithModeNull();
int TestPathAddPathWithOffsetAndModeNormal();
int TestPathAddPathWithOffsetAndModeNull();
int TestPathAddPathWithOffsetAndModeAbnormal();
int TestPathAddPathWithOffsetAndModeMaximal();
int TestPathAddOvalNormal();
int TestPathAddOvalNull();
int TestPathAddPolygonNormal();
int TestPathAddPolygonNormal2();
int TestPathAddPolygonNull();
int TestPathAddPolygonAbnormal();
int TestPathAddPolygonMaximal();
int TestPathAddCircleNormal();
int TestPathAddCircleNull();
int TestPathAddCircleAbnormal();
int TestPathAddCircleMaximal();
// Path Part2 Transform/Contains/Build related functions
int TestPathBuildFromSvgStringNormal();
int TestPathBuildFromSvgStringNull();
int TestPathContainsNormal();
int TestPathContainsNull();
int TestPathContainsAbnormal();
int TestPathContainsMaximal();
int TestPathTransformNormal();
int TestPathTransformNull();
int TestPathTransformWithPerspectiveClipNormal();
int TestPathTransformWithPerspectiveClipNormal2();
int TestPathTransformWithPerspectiveClipNull();
// Path Part2 Get/Set/Close/Offset/Reset related functions
int TestPathSetFillTypeNormal();
int TestPathSetFillTypeNull();
int TestPathSetFillTypeMultipleCalls();
int TestPathGetLengthNormal();
int TestPathGetLengthNormal2();
int TestPathGetLengthNull();
int TestPathGetBoundsNormal();
int TestPathGetBoundsNull();
int TestPathCloseNormal();
int TestPathCloseNull();
int TestPathOffsetNormal();
int TestPathOffsetNull();
int TestPathOffsetAbnormal();
int TestPathOffsetMaximal();
int TestPathResetNormal();
int TestPathResetNull();
int TestPathResetMultipleCalls();
// Path Part2 Add related functions
int TestPathAddArcNormal();
int TestPathAddArcNull();
int TestPathAddArcAbnormal();
int TestPathAddArcMaximal();
int TestPathAddPathNormal();
int TestPathAddPathNull();
int TestPathAddPathWithMatrixAndModeNormal();
int TestPathAddPathWithMatrixAndModeNull();
int TestPathAddPathWithModeNormal();
int TestPathAddPathWithModeNull();
int TestPathAddPathWithOffsetAndModeNormal();
int TestPathAddPathWithOffsetAndModeNull();
int TestPathAddPathWithOffsetAndModeAbnormal();
int TestPathAddPathWithOffsetAndModeMaximal();
int TestPathAddOvalNormal();
int TestPathAddOvalNull();
int TestPathAddPolygonNormal();
int TestPathAddPolygonNormal2();
int TestPathAddPolygonNull();
int TestPathAddPolygonAbnormal();
int TestPathAddPolygonMaximal();
int TestPathAddCircleNormal();
int TestPathAddCircleNull();
int TestPathAddCircleAbnormal();
int TestPathAddCircleMaximal();
// Path Part2 Transform/Contains/Build related functions
int TestPathBuildFromSvgStringNormal();
int TestPathBuildFromSvgStringNull();
int TestPathContainsNormal();
int TestPathContainsNull();
int TestPathContainsAbnormal();
int TestPathContainsMaximal();
int TestPathTransformNormal();
int TestPathTransformNull();
int TestPathTransformWithPerspectiveClipNormal();
int TestPathTransformWithPerspectiveClipNormal2();
int TestPathTransformWithPerspectiveClipNull();
// Path Part2 Get/Set/Close/Offset/Reset related functions
int TestPathSetFillTypeNormal();
int TestPathSetFillTypeNull();
int TestPathSetFillTypeMultipleCalls();
int TestPathGetLengthNormal();
int TestPathGetLengthNormal2();
int TestPathGetLengthNull();
int TestPathGetBoundsNormal();
int TestPathGetBoundsNull();
int TestPathCloseNormal();
int TestPathCloseNull();
int TestPathOffsetNormal();
int TestPathOffsetNull();
int TestPathOffsetAbnormal();
int TestPathOffsetMaximal();
int TestPathResetNormal();
int TestPathResetNull();
int TestPathResetMultipleCalls();
// Path Part3 Query related functions (IsClosed/IsEmpty/IsRect/GetFillType/IsInverseFillType)
int TestPathIsClosedNormal();
int TestPathIsClosedNormal2();
int TestPathIsClosedNull();
int TestPathIsEmptyNormal();
int TestPathIsEmptyNull();
int TestPathIsEmptyMultipleCalls();
int TestPathIsRectNormal();
int TestPathIsRectNull();
int TestPathIsRectMultipleCalls();
int TestPathGetFillTypeNormal();
int TestPathGetFillTypeNull();
int TestPathGetFillTypeMultipleCalls();
int TestPathIsInverseFillTypeNormalOne();
int TestPathIsInverseFillTypeNormalTwo();
int TestPathIsInverseFillTypeNormalThree();
int TestPathIsInverseFillTypeNormalFour();
int TestPathIsInverseFillTypeNull();
int TestPathToggleInverseFillTypeNull();
int TestPathIsInverseFillTypeCalls();
int TestPathToggleInverseFillTypeCalls();
// Path Part3 Transform related functions (GetPositionTangent/GetMatrix/GetSegment/Op)
int TestPathGetPositionTangentNormal();
int TestPathGetPositionTangentNormal2();
int TestPathGetPositionTangentNull();
int TestPathGetPositionTangentAbnormal();
int TestPathGetPositionTangentMaximal();
int TestPathOpNormal();
int TestPathOpNull();
int TestPathGetMatrixNormal();
int TestPathGetMatrixNormal2();
int TestPathGetMatrixNull();
int TestPathGetMatrixAbnormal();
int TestPathGetMatrixMaximal();
int TestPathGetSegmentNormal();
int TestPathGetSegmentNull();
int TestPathGetSegmentAbnormal();
int TestPathGetSegmentMultiplies();
// Path Part3 Advanced related functions (SetPath/Approximate/Interpolate)
int TestPathSetPathNormal();
int TestPathSetPathNull();
int TestPathSetPathMulptiCalls();
int TestPathApproximateNormal();
int TestPathApproximateNull();
int TestPathApproximateAbnormal();
int TestPathApproximateMultiCalls();
int TestPathInterpolateNormal();
int TestPathInterpolateNull();
int TestPathInterpolateAbnormal();
int TestPathInterpolateMultiCalls();
int TestPathIsInterpolateNormal();
int TestPathIsInterpolateNull();
int TestPathIsInterpolateMultiCalls();

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS

#endif // ACTSDRAWINGNATIVETEST_DRAWING_NATIVE_PATH_TEST_H
