#!/usr/bin/bash

answer=$1

case $answer in
     1) Microarchitecture=CONFIG_MK8 ;;             # AMD Opteron/Athlon64/Hammer/K8
     2) Microarchitecture=CONFIG_MK8SSE3 ;;         # AMD Opteron/Athlon64/Hammer/K8 with SSE3
     3) Microarchitecture=CONFIG_MK10 ;;            # AMD 61xx/7x50/PhenomX3/X4/II/K10
     4) Microarchitecture=CONFIG_MBARCELONA ;;      # AMD Family 10h (Barcelona)
     5) Microarchitecture=CONFIG_MBOBCAT ;;         # AMD Family 14h (Bobcat)
     6) Microarchitecture=CONFIG_MJAGUAR ;;         # AMD Family 16h (Jaguar)
     7) Microarchitecture=CONFIG_MBULLDOZER ;;      # AMD Family 15h (Bulldozer)
     8) Microarchitecture=CONFIG_MPILEDRIVER ;;     # AMD Family 15h (Piledriver)
     9) Microarchitecture=CONFIG_MSTEAMROLLER ;;    # AMD Family 15h (Steamroller)
    10) Microarchitecture=CONFIG_MEXCAVATOR ;;      # AMD Family 15h (Excavator)
    11) Microarchitecture=CONFIG_MZEN ;;            # AMD Family 17h (Zen)
    12) Microarchitecture=CONFIG_MZEN2 ;;           # AMD Family 17h (Zen 2)
    13) Microarchitecture=CONFIG_MZEN3 ;;           # AMD Family 19h (Zen 3)
    14) Microarchitecture=CONFIG_MZEN4 ;;           # AMD Family 19h (Zen 4)
    15) Microarchitecture=CONFIG_MPSC ;;            # Intel P4 / older Netburst based Xeon
    16) Microarchitecture=CONFIG_MCORE2 ;;          # Intel Core 2 and newer Core 2 Xeons (Xeon 51xx and 53xx)
    17) Microarchitecture=CONFIG_MATOM ;;           # Intel Atom
    18) Microarchitecture=CONFIG_MNEHALEM ;;        # Intel 1st Gen Core i3/i5/i7-family (Nehalem)
    19) Microarchitecture=CONFIG_MWESTMERE ;;       # Intel 1.5 Gen Core i3/i5/i7-family (Westmere)
    20) Microarchitecture=CONFIG_MSILVERMONT ;;     # Intel Silvermont
    21) Microarchitecture=CONFIG_MGOLDMONT ;;       # Intel Goldmont (Apollo Lake and Denverton)
    22) Microarchitecture=CONFIG_MGOLDMONTPLUS ;;   # Intel Goldmont Plus (Gemini Lake)
    23) Microarchitecture=CONFIG_MSANDYBRIDGE ;;    # Intel 2nd Gen Core i3/i5/i7-family (Sandybridge)
    24) Microarchitecture=CONFIG_MIVYBRIDGE ;;      # Intel 3rd Gen Core i3/i5/i7-family (Ivybridge)
    25) Microarchitecture=CONFIG_MHASWELL ;;        # Intel 4th Gen Core i3/i5/i7-family (Haswell)
    26) Microarchitecture=CONFIG_MBROADWELL ;;      # Intel 5th Gen Core i3/i5/i7-family (Broadwell)
    27) Microarchitecture=CONFIG_MSKYLAKE ;;        # Intel 6th Gen Core i3/i5/i7-family (Skylake)
    28) Microarchitecture=CONFIG_MSKYLAKEX ;;       # Intel 6th Gen Core i7/i9-family (Skylake X)
    29) Microarchitecture=CONFIG_MCANNONLAKE ;;     # Intel 8th Gen Core i3/i5/i7-family (Cannon Lake)
    30) Microarchitecture=CONFIG_MICELAKE ;;        # Intel 8th Gen Core i7/i9-family (Ice Lake)
    31) Microarchitecture=CONFIG_MCASCADELAKE ;;    # Xeon processors in the Cascade Lake family
    32) Microarchitecture=CONFIG_MCOOPERLAKE ;;     # Intel Xeon (Cooper Lake)
    33) Microarchitecture=CONFIG_MTIGERLAKE ;;      # Intel 3rd Gen 10nm++ i3/i5/i7/i9-family (Tiger Lake)
    34) Microarchitecture=CONFIG_MSAPPHIRERAPIDS ;; # Intel Sapphire Rapids
    35) Microarchitecture=CONFIG_MROCKETLAKE ;;     # Intel Rocket Lake
    36) Microarchitecture=CONFIG_MALDERLAKE ;;      # Intel Alder Lake
    91) Microarchitecture=CONFIG_GENERIC_CPU ;;     # Generic-x86-64-v1 (LEGACY < 2003. Not supported by XanMod project)
    92) Microarchitecture=CONFIG_GENERIC_CPU2 ;;    # Generic-x86-64-v2 (Nehalem and newer)
    93) Microarchitecture=CONFIG_GENERIC_CPU3 ;;    # Generic-x86-64-v3 (Haswell and newer)
    94) Microarchitecture=CONFIG_GENERIC_CPU4 ;;    # Generic-x86-64-v4 (AVX512 CPUs)
    98) Microarchitecture=CONFIG_MNATIVE_INTEL ;;   # Intel-Native optimizations autodetected by GCC
    99) Microarchitecture=CONFIG_MNATIVE_AMD ;;     # AMD-Native optimizations autodetected by GCC
     *) default=CONFIG_GENERIC_CPU2 ;;              # Generic x64-v2 (default)
esac

_defaultmicro=$(grep ^CONFIG_LOCALVERSION .config)
if [ -z "${default}" ]; then
    _localversion=$(echo ${Microarchitecture,,} | sed -e 's/config_m/-/g' -e 's/config_generic_cpu/-x64v/g')
    sed -e "s|^$_defaultmicro|CONFIG_LOCALVERSION=\"$_localversion\"|g" -i .config
fi

sed -e 's|^CONFIG_GENERIC_CPU=y|# CONFIG_GENERIC_CPU is not set|g' -i .config
sed -e 's|^CONFIG_GENERIC_CPU2=y|# CONFIG_GENERIC_CPU2 is not set|g' -i .config
sed -e 's|^CONFIG_GENERIC_CPU3=y|# CONFIG_GENERIC_CPU3 is not set|g' -i .config
sed -e 's|^CONFIG_GENERIC_CPU4=y|# CONFIG_GENERIC_CPU4 is not set|g' -i .config
sed -e "s|^# $Microarchitecture is not set|$Microarchitecture=y|g" -i .config
