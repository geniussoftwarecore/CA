// Peregrine Complaints Management System
// Offline-first web application with Arabic RTL support

class ComplaintsApp {
    constructor() {
        this.currentUser = null;
        this.currentRole = null;
        this.currentScreen = 'loading';
        this.complaints = [];
        this.categories = [];
        this.authorities = [];
        this.attachments = [];
        this.currentStep = 1;
        this.maxSteps = 5;
        
        this.init();
    }

    async init() {
        console.log('Initializing Complaints App...');
        
        // Load saved data
        await this.loadData();
        
        // Seed initial data if empty
        if (this.categories.length === 0) {
            this.seedInitialData();
        }
        
        // Set up event listeners
        this.setupEventListeners();
        
        // Show role selection after loading
        setTimeout(() => {
            this.showScreen('roleSelection');
        }, 2000);
    }

    // Data Management
    loadData() {
        try {
            const savedComplaints = localStorage.getItem('peregrine_complaints');
            const savedCategories = localStorage.getItem('peregrine_categories');
            const savedAuthorities = localStorage.getItem('peregrine_authorities');
            
            this.complaints = savedComplaints ? JSON.parse(savedComplaints) : [];
            this.categories = savedCategories ? JSON.parse(savedCategories) : [];
            this.authorities = savedAuthorities ? JSON.parse(savedAuthorities) : [];
            
            console.log(`Loaded ${this.complaints.length} complaints`);
        } catch (error) {
            console.error('Error loading data:', error);
            this.showToast('حدث خطأ في تحميل البيانات', 'error');
        }
    }

    saveData() {
        try {
            localStorage.setItem('peregrine_complaints', JSON.stringify(this.complaints));
            localStorage.setItem('peregrine_categories', JSON.stringify(this.categories));
            localStorage.setItem('peregrine_authorities', JSON.stringify(this.authorities));
            console.log('Data saved successfully');
        } catch (error) {
            console.error('Error saving data:', error);
            this.showToast('حدث خطأ في حفظ البيانات', 'error');
        }
    }

    seedInitialData() {
        console.log('Seeding initial data...');
        
        // Categories from the specification
        this.categories = [
            // المواصفات والمقاييس
            { id: '1', nameAr: 'سحب عينات متكررة لنفس المنتج', groupAr: 'المواصفات والمقاييس' },
            { id: '2', nameAr: 'عدم قبول الفحوصات السابقة', groupAr: 'المواصفات والمقاييس' },
            { id: '3', nameAr: 'مبالغة في الإجراءات الشكلية والمعاينة الظاهرية', groupAr: 'المواصفات والمقاييس' },
            { id: '4', nameAr: 'رفض شهادات المطابقة ونتائج الاختبار', groupAr: 'المواصفات والمقاييس' },
            { id: '5', nameAr: 'رفض تقارير اختبار العينات', groupAr: 'المواصفات والمقاييس' },
            { id: '6', nameAr: 'التحريز الشامل لجميع محتويات الشاحنة', groupAr: 'المواصفات والمقاييس' },
            { id: '7', nameAr: 'تأخير الإفراج / الفحص لمدة طويلة', groupAr: 'المواصفات والمقاييس' },
            { id: '8', nameAr: 'ارتفاع أجور الفحص', groupAr: 'المواصفات والمقاييس' },
            { id: '9', nameAr: 'الإجراءات على منتج سليم بسبب منتج مخالف', groupAr: 'المواصفات والمقاييس' },
            { id: '10', nameAr: 'التأخير في نتائج الفحص الظاهري', groupAr: 'المواصفات والمقاييس' },
            { id: '11', nameAr: 'تكرار الفحوصات لمنتجات سابقة', groupAr: 'المواصفات والمقاييس' },
            { id: '12', nameAr: 'غرامات غير قانونية', groupAr: 'المواصفات والمقاييس' },
            { id: '13', nameAr: 'ابتزاز', groupAr: 'المواصفات والمقاييس' },
            { id: '14', nameAr: 'إلزام المصنعين بمواصفات اختيارية', groupAr: 'المواصفات والمقاييس' },

            // الجمارك
            { id: '15', nameAr: 'إهمال البضائع عند المطابقة', groupAr: 'الجمارك' },
            { id: '16', nameAr: 'معاملة المواد الخام كمنتج نهائي للاستهلاك', groupAr: 'الجمارك' },
            { id: '17', nameAr: 'ازدواجية المطالبة بالضمان', groupAr: 'الجمارك' },
            { id: '18', nameAr: 'مخالفة اتفاق', groupAr: 'الجمارك' },
            { id: '19', nameAr: 'عدم البت في الإتلاف', groupAr: 'الجمارك' },
            { id: '20', nameAr: 'تفاوت أوقات المعاينة بين الجهات', groupAr: 'الجمارك' },
            { id: '21', nameAr: 'تأخر الإفراج لعدم الوزن', groupAr: 'الجمارك' },
            { id: '22', nameAr: 'الافتقار لنظام واضح لقيمة البضائع', groupAr: 'الجمارك' },
            { id: '23', nameAr: 'عدم حماية العلامة التجارية', groupAr: 'الجمارك' },
            { id: '24', nameAr: 'رفض إقرارات الشراء', groupAr: 'الجمارك' },
            { id: '25', nameAr: 'كسر الإعفاء المقدم', groupAr: 'الجمارك' },
            { id: '26', nameAr: 'مخالفة للتعميمات', groupAr: 'الجمارك' },
            { id: '27', nameAr: 'زيادة في القيمة الجمركية', groupAr: 'الجمارك' },
            { id: '28', nameAr: 'احتجاز بضائع خارجة من صنعاء', groupAr: 'الجمارك' },

            // الضرائب
            { id: '29', nameAr: 'طلب إقرارات سابقة', groupAr: 'الضرائب' },
            { id: '30', nameAr: 'تأخير استلام الإقرارات', groupAr: 'الضرائب' },
            { id: '31', nameAr: 'الدفع نقدًا/شيكات', groupAr: 'الضرائب' },
            { id: '32', nameAr: 'رفع ضريبة الأرباح', groupAr: 'الضرائب' },
            { id: '33', nameAr: 'طلب أصل البيان الجمركي', groupAr: 'الضرائب' },

            // صندوق النظافة والتحسين
            { id: '34', nameAr: 'التحصيل بين المديريات', groupAr: 'صندوق النظافة والتحسين' },
            { id: '35', nameAr: 'رسوم الدعاية والإعلان وازدواجية التحصيل', groupAr: 'صندوق النظافة والتحسين' },
            { id: '36', nameAr: 'ارتفاع الرسوم', groupAr: 'صندوق النظافة والتحسين' },
            { id: '37', nameAr: 'تحصيل بدون سندات', groupAr: 'صندوق النظافة والتحسين' },
            { id: '38', nameAr: 'أسلوب الإكراه', groupAr: 'صندوق النظافة والتحسين' },
            { id: '39', nameAr: 'ضعف التنسيق مع الأمن', groupAr: 'صندوق النظافة والتحسين' },
            { id: '40', nameAr: 'التنصل عن تنفيذ الاتفاقات', groupAr: 'صندوق النظافة والتحسين' }
        ];

        // Authorities
        this.authorities = [
            { id: 'auth1', nameAr: 'الهيئة اليمنية للمواصفات والمقاييس وضبط الجودة' },
            { id: 'auth2', nameAr: 'مصلحة الجمارك' },
            { id: 'auth3', nameAr: 'مصلحة الضرائب' },
            { id: 'auth4', nameAr: 'صندوق النظافة والتحسين' },
            { id: 'auth5', nameAr: 'وزارة الصناعة والتجارة' },
            { id: 'auth6', nameAr: 'وزارة المالية' },
            { id: 'auth7', nameAr: 'الهيئة العامة للاستثمار' },
            { id: 'auth8', nameAr: 'غرفة التجارة والصناعة' }
        ];

        this.saveData();
        this.showToast('تم تحميل البيانات الأولية بنجاح', 'success');
    }

    // Screen Management
    showScreen(screenId) {
        console.log(`Switching to screen: ${screenId}`);
        
        // Hide all screens
        const screens = document.querySelectorAll('.screen');
        screens.forEach(screen => screen.classList.remove('active'));
        
        // Show target screen
        const targetScreen = document.getElementById(screenId);
        if (targetScreen) {
            targetScreen.classList.add('active');
            this.currentScreen = screenId;
        } else {
            console.error(`Screen not found: ${screenId}`);
        }

        // Update screen-specific content
        this.updateScreenContent(screenId);
    }

    updateScreenContent(screenId) {
        switch (screenId) {
            case 'clientHome':
                this.updateClientDashboard();
                break;
            case 'supportHome':
                this.updateSupportDashboard();
                break;
            case 'coordinationHome':
                this.updateCoordinationDashboard();
                break;
            case 'complaintForm':
                this.setupComplaintForm();
                break;
        }
    }

    // Role Management
    selectRole(role) {
        console.log(`Role selected: ${role}`);
        
        if (role === 'client') {
            this.currentRole = 'client';
            this.currentUser = { id: 'client-user', role: 'client', displayName: 'عميل' };
            this.showScreen('clientHome');
        } else {
            this.requestPIN(role);
        }
    }

    requestPIN(role) {
        this.currentRole = role;
        const pinTitle = document.getElementById('pinTitle');
        
        if (role === 'support') {
            pinTitle.textContent = 'رمز PIN لجنة الدعم';
        } else if (role === 'coordination') {
            pinTitle.textContent = 'رمز PIN لجنة التنسيق العليا';
        }
        
        this.showScreen('pinEntry');
        document.getElementById('pinInput').focus();
    }

    async verifyPin() {
        const pinInput = document.getElementById('pinInput');
        const pinError = document.getElementById('pinError');
        const enteredPin = pinInput.value;

        // Default hashed PINs (SHA-256 of '1234' and '5678')
        const defaultHashedPINs = {
            support: 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', // 1234
            coordination: 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'  // 5678
        };

        const savedHashedPIN = localStorage.getItem(`pin_hash_${this.currentRole}`);
        const correctHashedPIN = savedHashedPIN || defaultHashedPINs[this.currentRole];
        
        const enteredHash = await this.hashString(enteredPin);

        if (enteredHash === correctHashedPIN) {
            this.currentUser = {
                id: `${this.currentRole}-user`,
                role: this.currentRole,
                displayName: this.currentRole === 'support' ? 'لجنة الدعم' : 'لجنة التنسيق العليا'
            };

            pinInput.value = '';
            pinError.textContent = '';

            if (this.currentRole === 'support') {
                this.showScreen('supportHome');
            } else if (this.currentRole === 'coordination') {
                this.showScreen('coordinationHome');
            }
        } else {
            pinError.textContent = 'رمز PIN غير صحيح';
            pinInput.value = '';
        }
    }

    logout() {
        this.currentUser = null;
        this.currentRole = null;
        this.showScreen('roleSelection');
        this.showToast('تم تسجيل الخروج بنجاح', 'success');
    }

    // Dashboard Updates
    updateClientDashboard() {
        const userComplaints = this.complaints.filter(c => c.status !== 'DELETED');
        
        document.getElementById('clientComplaintsCount').textContent = userComplaints.length;
        
        // Show recent complaints
        this.displayRecentComplaints(userComplaints.slice(-5).reverse());
    }

    updateSupportDashboard() {
        const inboxComplaints = this.complaints.filter(c => 
            c.status === 'NEW' || c.status === 'IN_REVIEW'
        );
        const assignedComplaints = this.complaints.filter(c => 
            c.assignedToUserId === this.currentUser.id
        );
        const resolvedSupport = this.complaints.filter(c => 
            c.status === 'RESOLVED_SUPPORT'
        );
        const escalated = this.complaints.filter(c => 
            c.status === 'ESCALATED'
        );

        document.getElementById('inboxCount').textContent = inboxComplaints.length;
        document.getElementById('assignedCount').textContent = assignedComplaints.length;
        document.getElementById('resolvedSupportCount').textContent = resolvedSupport.length;
        document.getElementById('escalatedCount').textContent = escalated.length;

        // Update today's stats
        const today = new Date().toDateString();
        const todayNew = this.complaints.filter(c => 
            new Date(c.createdAt).toDateString() === today
        );
        const todayResolved = this.complaints.filter(c => 
            c.status === 'RESOLVED_SUPPORT' && 
            new Date(c.updatedAt).toDateString() === today
        );
        const todayEscalated = this.complaints.filter(c => 
            c.status === 'ESCALATED' && 
            new Date(c.updatedAt).toDateString() === today
        );

        document.getElementById('todayNewCount').textContent = todayNew.length;
        document.getElementById('todayResolvedCount').textContent = todayResolved.length;
        document.getElementById('todayEscalatedCount').textContent = todayEscalated.length;
    }

    updateCoordinationDashboard() {
        const escalatedToCoord = this.complaints.filter(c => 
            c.status === 'ESCALATED'
        );
        const finalized = this.complaints.filter(c => 
            c.status === 'RESOLVED_COORD' || c.status === 'CLOSED'
        );
        const rejected = this.complaints.filter(c => 
            c.status === 'REJECTED'
        );

        document.getElementById('coordinationInboxCount').textContent = escalatedToCoord.length;
        document.getElementById('finalizedCount').textContent = finalized.length;
        document.getElementById('rejectedCount').textContent = rejected.length;

        // Summary statistics
        const totalComplaints = this.complaints.length;
        const resolvedCount = this.complaints.filter(c => 
            c.status === 'RESOLVED_SUPPORT' || c.status === 'RESOLVED_COORD' || c.status === 'CLOSED'
        ).length;
        const resolutionRate = totalComplaints > 0 ? Math.round((resolvedCount / totalComplaints) * 100) : 0;

        document.getElementById('totalComplaints').textContent = totalComplaints;
        document.getElementById('resolutionRate').textContent = `${resolutionRate}%`;
        document.getElementById('avgResolutionTime').textContent = '3-5 أيام'; // Placeholder
    }

    displayRecentComplaints(complaints) {
        const listContainer = document.getElementById('recentComplaintsList');
        
        if (complaints.length === 0) {
            listContainer.innerHTML = '<p style="text-align: center; color: #666;">لا توجد شكاوى</p>';
            return;
        }

        listContainer.innerHTML = complaints.map(complaint => `
            <div class="complaint-card" onclick="showComplaintDetail('${complaint.id}')">
                <div class="complaint-header">
                    <span class="complaint-id">#${complaint.id.substring(0, 8)}</span>
                    <span class="complaint-status status-${complaint.status.toLowerCase().replace('_', '-')}">${this.getStatusText(complaint.status)}</span>
                </div>
                <p><strong>الفئة:</strong> ${this.getCategoryName(complaint.categoryId)}</p>
                <p><strong>التاريخ:</strong> ${new Date(complaint.createdAt).toLocaleDateString('ar-SA')}</p>
                <p class="complaint-summary">${complaint.summary.substring(0, 100)}...</p>
            </div>
        `).join('');
    }

    // Complaint Form Management
    setupComplaintForm() {
        this.currentStep = 1;
        this.populateCategories();
        this.showStep(1);
    }

    populateCategories() {
        const categorySelect = document.getElementById('category');
        
        // Group categories by their group
        const groupedCategories = {};
        this.categories.forEach(category => {
            if (!groupedCategories[category.groupAr]) {
                groupedCategories[category.groupAr] = [];
            }
            groupedCategories[category.groupAr].push(category);
        });

        // Build select options with groups
        let optionsHTML = '<option value="">اختر فئة الشكوى</option>';
        Object.keys(groupedCategories).forEach(groupName => {
            optionsHTML += `<optgroup label="${groupName}">`;
            groupedCategories[groupName].forEach(category => {
                optionsHTML += `<option value="${category.id}">${category.nameAr}</option>`;
            });
            optionsHTML += '</optgroup>';
        });

        categorySelect.innerHTML = optionsHTML;
    }

    loadAuthorities() {
        const authoritySelect = document.getElementById('authority');
        
        let optionsHTML = '<option value="">اختر الجهة</option>';
        this.authorities.forEach(authority => {
            optionsHTML += `<option value="${authority.id}">${authority.nameAr}</option>`;
        });

        authoritySelect.innerHTML = optionsHTML;
    }

    showStep(step) {
        // Hide all steps
        const steps = document.querySelectorAll('.form-step');
        steps.forEach(s => s.classList.remove('active'));

        // Show current step
        document.getElementById(`step${step}`).classList.add('active');

        // Update navigation buttons
        const prevBtn = document.getElementById('prevStep');
        const nextBtn = document.getElementById('nextStep');
        const submitBtn = document.getElementById('submitComplaint');

        prevBtn.style.display = step > 1 ? 'block' : 'none';
        nextBtn.style.display = step < this.maxSteps ? 'block' : 'none';
        submitBtn.style.display = step === this.maxSteps ? 'block' : 'none';

        this.currentStep = step;
    }

    nextStep() {
        if (this.validateCurrentStep()) {
            if (this.currentStep < this.maxSteps) {
                this.showStep(this.currentStep + 1);
            }
        }
    }

    previousStep() {
        if (this.currentStep > 1) {
            this.showStep(this.currentStep - 1);
        }
    }

    validateCurrentStep() {
        let isValid = true;
        const currentStepElement = document.getElementById(`step${this.currentStep}`);
        const requiredInputs = currentStepElement.querySelectorAll('[required]');

        requiredInputs.forEach(input => {
            if (!input.value.trim()) {
                input.style.borderColor = '#f44336';
                isValid = false;
            } else {
                input.style.borderColor = '#ddd';
            }
        });

        if (!isValid) {
            this.showToast('يرجى ملء جميع الحقول المطلوبة', 'error');
        }

        return isValid;
    }

    submitComplaint() {
        if (!this.validateCurrentStep()) return;

        const formData = this.collectFormData();
        const complaint = this.createComplaint(formData);
        
        this.complaints.push(complaint);
        this.saveData();
        
        this.showToast('تم تقديم الشكوى بنجاح', 'success');
        this.resetComplaintForm();
        this.showScreen('clientHome');
    }

    collectFormData() {
        return {
            // Step 1: Complainant info
            firstName: document.getElementById('firstName').value,
            middleName: document.getElementById('middleName').value,
            lastName: document.getElementById('lastName').value,
            address: document.getElementById('address').value,
            phone: document.getElementById('phone').value,
            altPhone: document.getElementById('altPhone').value,
            whatsapp: document.getElementById('whatsapp').value,
            telegram: document.getElementById('telegram').value,
            email: document.getElementById('email').value,

            // Step 2: On behalf of
            onBehalfOf: document.getElementById('onBehalfOf').value,
            behalfName: document.getElementById('behalfName').value,
            behalfAddress: document.getElementById('behalfAddress').value,
            behalfPhone: document.getElementById('behalfPhone').value,
            behalfWhatsapp: document.getElementById('behalfWhatsapp').value,
            behalfTelegram: document.getElementById('behalfTelegram').value,
            relation: document.getElementById('relation').value,

            // Step 3: Complaint details
            category: document.getElementById('category').value,
            authority: document.getElementById('authority').value,
            requestType: document.getElementById('requestType').value,
            incidentDate: document.getElementById('incidentDate').value,
            awarenessDate: document.getElementById('awarenessDate').value,

            // Step 4: Summary and demands
            summary: document.getElementById('summary').value,
            authorityOffer: document.querySelector('input[name="authorityOffer"]:checked')?.value === 'yes',
            desiredResolution: document.getElementById('desiredResolution').value,
            previousComplaint: document.querySelector('input[name="previousComplaint"]:checked')?.value === 'yes',
            legalAction: document.querySelector('input[name="legalAction"]:checked')?.value === 'yes',

            // Step 5: Attachments
            attachmentNotes: document.getElementById('attachmentNotes').value
        };
    }

    createComplaint(formData) {
        const now = new Date().toISOString();
        const complaint = {
            id: this.generateUUID(),
            createdAt: now,
            updatedAt: now,

            // Complainant information
            complainantFirstName: formData.firstName,
            complainantMiddleName: formData.middleName || null,
            complainantLastName: formData.lastName,
            address: formData.address,
            phone: formData.phone,
            altPhone: formData.altPhone || null,
            whatsapp: formData.whatsapp || null,
            telegram: formData.telegram || null,
            email: formData.email || null,

            // On behalf of information
            onBehalfOfType: formData.onBehalfOf,
            behalfFullName: formData.behalfName || null,
            behalfAddress: formData.behalfAddress || null,
            behalfPhone: formData.behalfPhone || null,
            behalfWhatsapp: formData.behalfWhatsapp || null,
            behalfTelegram: formData.behalfTelegram || null,
            behalfRelation: formData.relation || null,

            // Complaint details
            categoryId: formData.category,
            authorityId: formData.authority || null,
            requestType: formData.requestType || null,
            incidentDate: formData.incidentDate || null,
            awarenessDate: formData.awarenessDate || null,
            summary: formData.summary,
            authorityOfferProvided: formData.authorityOffer,
            desiredResolution: formData.desiredResolution || null,
            previousComplaint: formData.previousComplaint,
            legalActionExists: formData.legalAction,

            // Status and workflow
            status: 'NEW',
            assignedToUserId: null
        };

        return complaint;
    }

    resetComplaintForm() {
        document.getElementById('complaintFormData').reset();
        this.currentStep = 1;
        this.showStep(1);
    }

    // Security Functions
    async hashString(str) {
        const encoder = new TextEncoder();
        const data = encoder.encode(str);
        const hashBuffer = await crypto.subtle.digest('SHA-256', data);
        const hashArray = Array.from(new Uint8Array(hashBuffer));
        return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
    }

    // Utility Functions
    generateUUID() {
        return 'xxxx-xxxx-4xxx-yxxx-xxxx'.replace(/[xy]/g, function(c) {
            const r = Math.random() * 16 | 0;
            const v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }

    getStatusText(status) {
        const statusTexts = {
            'NEW': 'جديد',
            'IN_REVIEW': 'قيد المراجعة',
            'RESOLVED_SUPPORT': 'محلول - الدعم',
            'ESCALATED': 'محول',
            'RESOLVED_COORD': 'محلول - التنسيق',
            'CLOSED': 'مغلق',
            'REJECTED': 'مرفوض'
        };
        return statusTexts[status] || status;
    }

    getCategoryName(categoryId) {
        const category = this.categories.find(c => c.id === categoryId);
        return category ? category.nameAr : 'غير محدد';
    }

    showToast(message, type = 'info') {
        const toast = document.getElementById('toast');
        toast.textContent = message;
        toast.className = `toast ${type}`;
        toast.classList.add('show');

        setTimeout(() => {
            toast.classList.remove('show');
        }, 3000);
    }

    // Event Listeners
    setupEventListeners() {
        // Handle form submission
        const complaintForm = document.getElementById('complaintFormData');
        complaintForm.addEventListener('submit', (e) => {
            e.preventDefault();
            this.submitComplaint();
        });

        // Handle PIN entry
        document.getElementById('pinInput').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                this.verifyPin();
            }
        });

        // Handle on behalf of type change
        document.getElementById('onBehalfOf')?.addEventListener('change', () => {
            this.toggleBehalfFields();
        });
    }

    // Navigation functions (called from HTML)
    goBack() {
        if (this.currentScreen === 'pinEntry') {
            this.showScreen('roleSelection');
        } else if (this.currentScreen === 'complaintForm') {
            this.showScreen('clientHome');
        } else if (this.currentScreen === 'settings') {
            this.showScreen('roleSelection');
        } else {
            this.showScreen('roleSelection');
        }
    }

    showComplaintForm() {
        this.showScreen('complaintForm');
    }

    showMyComplaints() {
        this.showComplaintsList('client');
    }

    showSettings() {
        this.showScreen('settings');
    }

    toggleTheme() {
        document.body.classList.toggle('dark-theme');
        const isDark = document.body.classList.contains('dark-theme');
        localStorage.setItem('darkTheme', isDark);
        this.showToast(isDark ? 'تم تفعيل الوضع المظلم' : 'تم تفعيل الوضع النهاري', 'success');
    }

    toggleBehalfFields() {
        const onBehalfType = document.getElementById('onBehalfOf').value;
        const behalfFields = document.getElementById('behalfFields');
        
        if (onBehalfType === 'self') {
            behalfFields.style.display = 'none';
        } else {
            behalfFields.style.display = 'block';
        }
    }

    // Export/Import functions
    exportAllData() {
        const data = {
            complaints: this.complaints,
            categories: this.categories,
            authorities: this.authorities,
            exportDate: new Date().toISOString(),
            version: '1.0.0'
        };

        const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `peregrine_complaints_backup_${new Date().toISOString().split('T')[0]}.json`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);

        this.showToast('تم تصدير البيانات بنجاح', 'success');
    }

    clearAllData() {
        if (confirm('هل أنت متأكد من حذف جميع البيانات؟ لا يمكن التراجع عن هذا الإجراء.')) {
            localStorage.clear();
            this.complaints = [];
            this.categories = [];
            this.authorities = [];
            this.seedInitialData();
            this.showToast('تم مسح جميع البيانات', 'success');
            this.showScreen('roleSelection');
        }
    }
}

// Global functions for HTML event handlers
function selectRole(role) {
    window.app.selectRole(role);
}

function verifyPin() {
    window.app.verifyPin();
}

function logout() {
    window.app.logout();
}

function goBack() {
    window.app.goBack();
}

function showComplaintForm() {
    window.app.showComplaintForm();
}

function showMyComplaints() {
    window.app.showMyComplaints();
}

function showSettings() {
    window.app.showSettings();
}

function toggleTheme() {
    window.app.toggleTheme();
}

function nextStep() {
    window.app.nextStep();
}

function previousStep() {
    window.app.previousStep();
}

function toggleBehalfFields() {
    window.app.toggleBehalfFields();
}

function loadAuthorities() {
    window.app.loadAuthorities();
}

function exportAllData() {
    window.app.exportAllData();
}

function clearAllData() {
    window.app.clearAllData();
}

// Initialize the app when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.app = new ComplaintsApp();
});

console.log('Peregrine Complaints App loaded successfully');