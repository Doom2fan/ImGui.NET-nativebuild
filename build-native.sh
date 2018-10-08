#!/usr/bin/env bash

scriptPath="`dirname \"$0\"`"
cimguiPath=$scriptPath/cimgui

_CMakeBuildType=Debug

while :; do
    if [ $# -le 0 ]; then
        break
    fi

    lowerI="$(echo $1 | awk '{print tolower($0)}')"
    case $lowerI in
        debug|-debug)
            _CMakeBuildType=Debug
            ;;
        release|-release)
            _CMakeBuildType=Release
            ;;
        *)
            __UnprocessedBuildArgs="$__UnprocessedBuildArgs $1"
    esac

    shift
done

mkdir -p $cimguiPath/build/$_CMakeBuildType
pushd $cimguiPath/build/$_CMakeBuildType
cmake ../.. -DCMAKE_BUILD_TYPE=$_CMakeBuildType
make
popd
