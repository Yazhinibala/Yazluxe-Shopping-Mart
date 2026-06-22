<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap 5 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
  * { font-family: 'Poppins', sans-serif; }

  body { background: #f0f2f5; }

  /* Navbar */
  .navbar { background: linear-gradient(90deg, #1a1a2e, #16213e, #0f3460) !important; box-shadow: 0 2px 15px rgba(0,0,0,0.3); }
  .navbar-brand { font-size: 1.5rem; font-weight: 700; color: #e94560 !important; letter-spacing: 1px; }
  .nav-link { color: #ccc !important; font-weight: 500; transition: color 0.2s; }
  .nav-link:hover { color: #e94560 !important; }
  .nav-link.text-warning { color: #ffd700 !important; }

  /* Hero Banner */
  .hero-banner {
    background: linear-gradient(135deg, #1a1a2e 0%, #e94560 50%, #f5a623 100%);
    border-radius: 16px;
    padding: 60px 30px;
    margin-bottom: 30px;
    box-shadow: 0 8px 32px rgba(233,69,96,0.3);
  }

  /* Product Cards */
  .product-card {
    border: none;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    background: #fff;
  }
  .product-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 30px rgba(233,69,96,0.2);
  }
  .product-card .card-img-top {
    height: 220px;
    object-fit: cover;
    transition: transform 0.4s ease;
  }
  .product-card:hover .card-img-top { transform: scale(1.05); }
  .img-wrapper { overflow: hidden; }

  .price { color: #e94560; font-weight: 700; font-size: 1.1rem; }
  .category-badge {
    background: linear-gradient(90deg, #667eea, #764ba2);
    color: white;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 0.75rem;
    display: inline-block;
  }

  /* Buttons */
  .btn-cart {
    background: #1a1a2e;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 0.82rem;
    padding: 7px 10px;
    transition: background 0.2s;
  }
  .btn-cart:hover { background: #0f3460; color: white; }

  .btn-buy {
    background: linear-gradient(90deg, #e94560, #f5a623);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 0.82rem;
    padding: 7px 10px;
    transition: opacity 0.2s;
  }
  .btn-buy:hover { opacity: 0.9; color: white; }

  /* Section heading */
  .section-heading {
    font-weight: 700;
    color: #1a1a2e;
    border-left: 4px solid #e94560;
    padding-left: 12px;
    margin-bottom: 20px;
  }

  /* Table styling */
  .custom-table thead { background: linear-gradient(90deg, #1a1a2e, #0f3460); color: white; }
  .custom-table tbody tr:hover { background: #fff0f3; }

  /* Footer */
  footer { background: linear-gradient(90deg, #1a1a2e, #16213e) !important; }
</style>
