" Vim syntax file
" Language:    Foo
" Version:     0.0
" Last Change: 6/8/2014
" Maintainer:  Dylan Jayatilaka <dylan.jayatilaka@gmail.com>
" Credits:     Based on Ajit Thakkar's fortran.vim file

" Quit if a syntax file is already loaded
if exists("b:current_syntax")
  finish
endif

set comments=:!

syn match   fooUnitHeader          "\<function\>"
syn match   fooUnitHeader          "\<program\>"
syn match   fooUnitHeader          "\<subroutine\>"
syn match   fooUnitHeader          "\<end\>"
syn match   fooUnitHeader          "\<module\>"
syn match   fooUnitHeader          "\<end\s*function"
syn match   fooUnitHeader          "\<end\s*interface"
syn match   fooUnitHeader          "\<end\s*module"
syn match   fooUnitHeader          "\<end\s*program"
syn match   fooUnitHeader          "\<end\s*subroutine"

syn keyword fooUnitHeader          use only contains
syn keyword fooUnitHeader          result interface operator

syn keyword fooUnitHeaderBad       procedure
syn keyword fooUnitHeaderOld       entry
syn match   fooUnitHeaderOld       display "block\s\+data"

syn match   fooType                "\<implicit\>"
syn match   fooType                "\<implicit\s\+real"
syn match   fooType                "^\s*real\>"
syn match   fooType                "\<implicit\s\+logical"
syn match   fooType                "^\s*logical\>"
syn keyword fooType                character complex integer
syn keyword fooType                intrinsic

syn keyword fooStructure           dimension
syn keyword fooStructure           private public intent optional
syn keyword fooStructure           pointer target allocatable readonly selfless

syn keyword fooStorageClass        data parameter
syn match   fooStorageClass        "\<kind\s*="me=s+4
syn match   fooStorageClass        "\<len\s*="me=s+3
syn keyword fooStorageClass        sequence
syn keyword fooStorageClass        in out
syn keyword fooStorageClassOld     common equivalence save

syn keyword fooCall                call

syn keyword fooStatement           ENSURE DIE WARN DIE_IF
syn keyword fooStatement           return stop
syn keyword fooStatement           allocate deallocate nullify cycle exit
syn keyword fooStatementOld        continue
syn match   fooStatementOld        "\<go\s*to\>"
syn keyword fooStatementOld        assign pause to

syn match   fooConditional         "\<if\>"
syn keyword fooConditional         else then
syn match   fooConditional         "\<else\s*if"
syn match   fooConditional         "\<end\s*if"
syn match   fooConditional         "\<select\>"
syn keyword fooConditional         case default
syn match   fooConditional         "\<end\s*select"
syn match   fooConditional         "\<select\s*case"
syn keyword fooConditional         where elsewhere
syn match   fooConditional         "\<end\s*where"
syn match   fooConditional         "end"
syn keyword fooConditionalBad      while

syn match   fooLoop                "\(\<parallel\> \)\?\<do\>"
syn match   fooLoop                "\<end\s*do"
syn keyword fooLoop                forall
syn match   fooLoop                "\<end\s*forall"
syn match   fooLoop                "\(\<end\s*forall\s\+\)\@<=\a\w*\>"
syn match   fooLoop                "\(\<end\s*do\s\+\)\@<=\a\w*\>"
syn match   fooLoop                "\(\<end\s*if\s\+\)\@<=\a\w*\>"
syn match   fooLoop                "\(\<end\s*select\s\+\)\@<=\a\w*\>"

syn keyword fooTodo                contained todo fixme

"Catch errors caused by too many right parentheses
syn region  fooParen               transparent start="(" end=")" contains=ALLBUT,fooParenError,@fooCommentGroup
syn match   fooParenError          ")"

syn match   fooOperator            "\(+\|-\|/\|\*\|@\)"

syn match   fooBoolean             "\(TRUE\|FALSE\)"
syn match   fooBooleanOld          "\.\s*\(TRUE\|FALSE\)\s*\."
syn match   fooBooleanOld          "\.\s*\(true\|false\)\s*\."

syn match   fooBoolOperator        "\(\(>\|<\)=\|==\|/=\|=\|=>\)"
syn keyword fooBoolOperator        AND OR EQV NEQV NOT
syn match   fooBoolOperatorOld     "\.\s*\(GT\|gt\|LT\|lt\|LEQ\|leq\|NE\|ne\|eq\|ne\)\s*\."
syn match   fooBoolOperatorOld     "\.\s*\(AND\|OR\|XOR\|NOT\|EQV\|NEQV\)\s*\."
syn match   fooOperatorOld         "\.\s*\(and\|or\|xor\|not\|eqv\|neqv\)\s*\."

syn keyword fooArgDecl             "::"
syn keyword fooProcDecl            ":::"

syn keyword fooArgIntent           IN INOUT OUT
syn keyword fooProcIntent          elemental ELEMENTAL impure pure PURE
syn keyword fooProcIntent          leaky recursive routinal functional
syn keyword fooProcIntent          get_from inlined_by_foo template

syn match   fooTab                 "\t"

syn keyword fooReadWrite           backspace close inquire open rewind endfile
syn keyword fooReadWrite           read write print

syn keyword fooIO                  unit file iostat access blank fmt form
syn keyword fooIO                  recl status exist opened number named name
syn keyword fooIO                  sequential direct rec
syn keyword fooIO                  formatted unformatted nextrec
syn match   fooIO                  contains=fooOperator "\<e\(nd\|rr\)\s*=\s*\d\+"
syn keyword fooIO                  pad position action delim readwrite
syn keyword fooIO                  eor advance nml
syn keyword fooIOBad               format
syn keyword fooIOBad               namelist

syn keyword foo66IntrinsicOld      cabs ccos cexp clog csin csqrt
syn keyword foo66IntrinsicOld      dacos dasin datan datan2 dcos dcosh
syn keyword foo66IntrinsicOld      ddim dexp dint dlog dlog10 dmod dabs
syn keyword foo66IntrinsicOld      dnint dsign dsin dsinh dsqrt dtan
syn keyword foo66IntrinsicOld      dtanh iabs idim idnint isign idint ifix
syn keyword foo66IntrinsicOld      amax0 amax1 dmax1 max0 max1
syn keyword foo66IntrinsicOld      amin0 amin1 dmin1 min0 min1
syn keyword foo66IntrinsicOld      amod float sngl alog alog10

syn keyword foo77Intrinsic         abs acos aimag aint anint asin atan atan2
syn keyword foo77Intrinsic         cos sin tan sinh cosh tanh exp log log10
syn keyword foo77Intrinsic         sign sqrt int cmplx nint min max conjg
syn keyword foo77Intrinsic         char ichar index
syn match   foo77Intrinsic         "\<len\s*[(,]"me=s+3
syn match   foo77Intrinsic         "\<real\s*("me=s+4
syn keyword foo77IntrinsicOld      dble dprod
syn keyword foo77IntrinsicOld      lge lgt lle llt mod

syn keyword foo90Intrinsic         achar adjustl adjustr all allocated any
syn keyword foo90Intrinsic         associated bit_size btest ceiling
syn keyword foo90Intrinsic         count cshift date_and_time
syn keyword foo90Intrinsic         digits dot_product eoshift epsilon exponent
syn keyword foo90Intrinsic         floor fraction huge iachar iand ibclr ibits ibset ieor
syn keyword foo90Intrinsic         ior ishft ishftc lbound len_trim
syn keyword foo90Intrinsic         matmul maxexponent maxloc maxval merge
syn keyword foo90Intrinsic         minexponent minloc minval modulo mvbits nearest
syn keyword foo90Intrinsic         pack present product radix random_number
syn keyword foo90Intrinsic         random_seed range repeat reshape rrspacing scale
syn keyword foo90Intrinsic         selected_int_kind selected_real_kind scan
syn keyword foo90Intrinsic         shape size spacing spread set_exponent
syn keyword foo90Intrinsic         tiny transfer transpose trim ubound unpack verify
syn keyword foo90Intrinsic         precision sum system_clock
syn match   foo90Intrinsic         "\<not\>\(\s*\.\)\@!"me=s+3
syn match   foo90Intrinsic         "\<kind\>\s*[(]"me=s+4
syn match   foo90Intrinsic         "\<logical\s*("me=s+7
syn keyword foo95Intrinsic         null cpu_time

" Intrinsics provided by some vendors
syn keyword fooSpecialIntrinsic    cdabs cdcos cdexp cdlog cdsin cdsqrt
syn keyword fooSpecialIntrinsic    cqabs cqcos cqexp cqlog cqsin cqsqrt
syn keyword fooSpecialIntrinsic    qacos qasin qatan qatan2 qcos qcosh
syn keyword fooSpecialIntrinsic    qdim qexp iqint qlog qlog10 qmod qabs
syn keyword fooSpecialIntrinsic    qnint qsign qsin qsinh qsqrt qtan
syn keyword fooSpecialIntrinsic    qtanh qmax1 qmin1
syn keyword fooSpecialIntrinsic    dimag qimag dcmplx qcmplx dconjg qconjg
syn keyword fooSpecialIntrinsic    gamma dgamma qgamma algama dlgama qlgama
syn keyword fooSpecialIntrinsic    erf derf qerf erfc derfc qerfc


" Integer
syn match   fooNumber              display "\<\d\+\(_\a\w*\)\=\>"

" String
syn region  fooStringBad           start=+'+ end=+'+ contains=fooContinueMark,fooLeftMargin

" Float
syn match   fooFloat               display "\<\d\+\.\d\+\(e[-+]\=\d\+\)\=\(_\a\w*\)\=\>"

" Bad Floats
syn match   fooFloatNoDecBad       display "\<\d\+[deq][-+]\=\d\+\(_\a\w*\)\=\>"
syn match   fooFloatIniDecBad      display "\.\d\+\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match   fooFloatEndDecBad      display "\<\d\+\.\([deq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"
syn match   fooFloatDExpBad        display "\<\d\+\.\d\+\([dq][-+]\=\d\+\)\=\(_\a\w*\)\=\>"

" Numbers in format specifiers
syn match   fooFormatSpec          display "\d*f\d\+\.\d\+"
syn match   fooFormatSpec          display "\d*e[sn]\=\d\+\.\d\+\(e\d+\>\)\="
syn match   fooFormatSpec          display "\d*\(d\|q\|g\)\d\+\.\d\+\(e\d+\)\="
syn match   fooFormatSpec          display "\d\+x\>"

" The next match would pick up identifiers as well
" syn match fooFormatSpec    display    "\<\(a\|i\)\d\+"

" Numbers as labels
syn match   fooLabelNumberOld      display "^\d\{1,5}\>"
syn match   fooLabelNumberOld      display "^ \d\{1,4}\>"ms=s+1
syn match   fooLabelNumberOld      display "^  \d\{1,3}\>"ms=s+2
syn match   fooLabelNumberOld      display "^   \d\d\=\>"ms=s+3
syn match   fooLabelNumberOld      display "^    \d\>"ms=s+4

" Numbers as targets
syn match   fooTargetOld           display "\(\<if\s*(.\+)\s*\)\@<=\(\d\+\s*,\s*\)\{2}\d\+\>"
syn match   fooTargetOld           display "\(\<do\s\+\)\@<=\d\+\>"
syn match   fooTargetOld           display "\(\<go\s*to\s*(\=\)\@<=\(\d\+\s*,\s*\)*\d\+\>"


syn keyword fooType                type array none
syn match   fooType                "\<end\s*type"
syn keyword fooTypeBad             external
syn match   fooTypeOld             display "double\s\+precision"
syn match   fooTypeOld             display "double\s\+complex"


syn keyword fooInclude             include


syn cluster fooCommentGroup        contains=fooTodo
syn match   fooComment             excludenl "!.*$" contains=@fooCommentGroup

"cpp is often used with foo
syn match   cPreProc               "^\s*#\s*\(define\|ifdef\)\>.*"
syn match   cPreProc               "^\s*#\s*\(elif\|if\)\>.*"
syn match   cPreProc               "^\s*#\s*\(ifndef\|undef\)\>.*"
syn match   cPreCondit             "^\s*#\s*\(else\|endif\)\>"
syn region  cIncluded              contained start=+"[^(]+ skip=+\\\\\|\\"+ end=+"+ contains=fooLeftMargin,fooContinueMark
syn match   cIncluded              contained "<[^>]*>"
syn match   cInclude               "^\s*#\s*include\>\s*["<]" contains=cIncluded

"Synchronising limits assume that comment and continuation lines are not mixed
syn sync minlines=20

if exists("foo_fold")
  syn sync   fromstart
  syn region fooModule             transparent fold keepend start="^\(virtual \)\?module\s\+\z(\a\w*\)" excludenl end="^end\s*\(module\(\s\+\z1\>\)\=\|$\)" contains=ALLBUT,fooProgram
  syn region fooSubroutine         transparent fold keepend extend start="^!\=   \z(\a\w*\)\(.*\_s\_^!\=   !\)\@=" excludenl end="^!\=   end\s*\($\|subroutine\)" contains=ALLBUT,fooProgram,fooModule,fooSubroutine,fooFunction
  syn region fooFunction           transparent fold keepend extend start="^!\=   \z(\a\w*\)\(.* result.*\_s\_^!\=   !\)\@=" excludenl end="^!\=   end\s*\($\|function\)" contains=ALLBUT,fooProgram,fooModule,fooSubroutine,fooFunction
  syn region fooInterface          transparent fold keepend extend start="^\s*interface\s\+\z(\a\w*\)" excludenl end="\<end\s*\($\|interface\(\s\+\z1\>\)\=\)" contains=ALLBUT,fooProgram,fooModule
  syn region fooType               transparent fold keepend extend start="^!\=\s*\(array\|type\)\s\+\z(\a\w*\)" excludenl end="\<end\s*\($\|type\(\s\+\z1\>\)\=\)" contains=ALLBUT,fooProgram,fooModule,fooSubroutine,fooFunction
  syn region fooData               transparent fold keepend start="^!\=   data\s\+\z(\a\(\w\|[( :,)]\)*\)/" excludenl end="!\=/\s*\($\|!.*$\)" contains=ALLBUT,fooProgram,fooModule,fooSubroutine,fooFunction,fooInterface,fooData
endif

" Highlighting
" Transparent groups: fooParen, fooLeftMargin fooProgram, fooModule,
" fooSubroutine, fooFunction, fooBlockDat, foo77Loop, foo90Loop,
" fooIfBlock, fooCase

hi def link fooStatement        Statement
hi def link fooConditional      Conditional
hi def link fooLoop             Repeat
hi def link fooString           String
hi def link fooNumber           Number
hi def link fooOperator         Operator
hi def link fooBoolOperator     Operator
hi def link fooArgIntent        Statement
hi def link fooProcIntent       Statement
hi def link fooArgDecl          Operator
hi def link fooProcDecl         Operator
hi def link fooBoolean          Boolean
hi def link fooType             Type
hi def link fooStructure        Type
hi def link fooCall             Special
hi def link fooUnitHeader       Statement
hi def link fooReadWrite        foo90Intrinsic
hi def link foo95Intrinsic      foo90Intrinsic
hi def link foo77Intrinsic      foo90Intrinsic
hi def link foo90Intrinsic      Special
hi def link fooFloat            Float
hi def link fooInclude          Include
hi def link cIncluded           fooString
hi def link cInclude            Include
hi def link cPreProc            PreProc
hi def link fooPreCondit        PreCondit
hi def link cPreCondit          PreCondit
hi def link fooComment          Comment
hi def link fooFormatSpec       Special

" Uncomment the next line if you foo variables are to be highlighted
"hi def link fooIdentifier        Identifier

" Vendor extensions
hi def link fooSpecialIntrinsic Special

" Todo
hi def link fooTodo             Todo
hi def link fooContinueMark     Todo


" Errors

hi def link fooOperatorBad      Error
hi def link fooOperatorOld      Error
hi def link fooStatementOld     Error
hi def link foo66IntrinsicOld   Error
hi def link foo77IntrinsicOld   Error
hi def link fooUnitHeaderOld    Error
hi def link fooUnitHeaderBad    Error
hi def link fooTypeOld          Error
hi def link fooStorageClassOld  Error
hi def link fooLabelNumberOld   Error
hi def link fooTargetOld        Error
hi def link fooBooleanOld       Error
hi def link fooBoolOperatorOld  Error
hi def link fooFloatNoDecBad    Error
hi def link fooFloatIniDecBad   Error
hi def link fooFloatEndDecBad   Error
hi def link fooFloatDExpBad     Error
hi def link fooTypeBad          Error
hi def link fooIOBad            Error
hi def link fooStringBad        Error
hi def link foo77IntrinsicOld   Error
hi def link fooConditionalBad   Error
hi def link fooParenError       Error
hi def link fooTab              Error


" Modifications for Foo

syn keyword fooStructure PTR

" Built-in and virtual types
syn keyword fooType SELF_TYPE
syn keyword fooType ELEMENT_TYPE
syn keyword fooType OBJECT
syn keyword fooType INTRINSIC
syn keyword fooType MAP KEY VAL

" Derived types and system
syn keyword fooType TYPES
syn keyword fooType SYSTEM
syn keyword fooType DEBUG
syn keyword fooType TIME
syn keyword fooType PARALLEL
syn keyword fooType COMMAND_LINE

" Intrinsic types and arrays
syn keyword fooType STR BSTR BIN INT REAL CPX
syn keyword fooType VEC  MAT  MAT3  MAT4  MAT5  MAT6  MAT7
syn keyword fooType VEC_ MAT_ MAT3_ MAT4_ MAT5_ MAT6_ MAT7_
syn keyword fooType OPVECTOR OPMATRIX

" Files & IO
syn keyword fooType ARCHIVE
syn keyword fooType TEXTFILE
syn keyword fooType FILE
syn keyword fooType CIF
syn keyword fooType BUFFER
syn keyword fooType UNIT_NUMBER
syn keyword fooType TABLE_COLUMN

" Gaussians, basis functions and shells
syn keyword fooType GAUSSIAN
syn keyword fooType GAUSSIAN2
syn keyword fooType GAUSSIAN4

syn keyword fooType SHELL SHELL1 SHELL2 SHELL4
syn keyword fooType SHELLPAIR  SHELLQUARTET
syn keyword fooType SHELL1PAIR SHELL1QUARTET
syn keyword fooType SLATERSHELL
syn keyword fooType COPPENSORBITAL

" Bases
syn keyword fooType BASIS
syn keyword fooType SLATERBASIS
syn keyword fooType COPPENSBASIS

" Integrals
syn keyword fooType RYS
syn keyword fooType GAUSSIAN_DATA
syn keyword fooType RMS_INDICES RMS2_INDICES

" DFT and numerical integration
syn keyword fooType BECKE_GRID
syn keyword fooType LEBEDEV
syn keyword fooType QUADRATURE
syn keyword fooType DFT_FUNCTIONAL

" Symmetry
syn keyword fooType SPACEGROUP
syn keyword fooType POINTGROUP
syn keyword fooType IRREP

" Crystals, unit cells and reflection data
syn keyword fooType CRYSTAL
syn keyword fooType UNIT_CELL
syn keyword fooType DIFFRACTION_DATA
syn keyword fooType REFLECTION
syn keyword fooType MULTI_T_ADP

" Colours
syn keyword fooType COLOR
syn keyword fooType COLOR_FUNCTION

" Plots and isosurfaces
syn keyword fooType CAPPING_SQUARE
syn keyword fooType ISOSURFACE
syn keyword fooType PLOT_GRID
syn keyword fooType MARCHINGCUBE

" SCF & wavefunctions
syn keyword fooType SCFDATA
syn keyword fooType DIIS FOCK_DIIS

" Properties and analysis
syn keyword fooType INTERPOLATOR
syn keyword fooType ROBY

" Terms and polynomials
syn keyword fooType TERM_1D
syn keyword fooType TERM
syn keyword fooType POLYNOMIAL

" Geminals
syn keyword fooType GEMINAL_MF_SPECTRUM
syn keyword fooType GEMINAL_MF_SCHEME

" Atoms, clusters and molecules
syn keyword fooType ATOM
syn keyword fooType ATOM_GROUP
syn keyword fooType CLUSTER
syn keyword fooType MOLECULE
syn keyword fooType MOLECULE.BASE
syn keyword fooType MOLECULE.CE
syn keyword fooType MOLECULE.CP
syn keyword fooType MOLECULE.FOCK
syn keyword fooType MOLECULE.GEM
syn keyword fooType MOLECULE.GRID
syn keyword fooType MOLECULE.INTS
syn keyword fooType MOLECULE.MAIN
syn keyword fooType MOLECULE.MISC
syn keyword fooType MOLECULE.PLOT
syn keyword fooType MOLECULE.PROP
syn keyword fooType MOLECULE.REL
syn keyword fooType MOLECULE.SCF
syn keyword fooType MOLECULE.TAD
syn keyword fooType MOLECULE.XTAL


hi! link fooContinueMark NONE
hi! Identifier term=underline ctermfg=Black guifg=Black

let b:current_syntax = "foo"
